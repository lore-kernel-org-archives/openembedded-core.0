Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbHaA-0007ZN-53
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 22:11:42 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3535569pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 12:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=slu4kYLbMCYr+i0F/o/fptw7GYtWxo1EAwezKfhqwgM=;
	b=e8c+xRJdlb912f9VIXR/mL4+/gVcvMjX/Lh+KzFwXUnsRZLfvyi22dSSC9VS2fxKuI
	lGEgh5T0uIp1OrqiHEVm7Qk+4mFqtb/qDLCgKwbp4zmGGKbqS5WIGKkA1JoU2O8eCb6T
	RjrI6gas5+gzc7Emg6KLGADEGh+t42MLgp6schJPDTBau9nix7UZ487I4Vcx8s71v4Yv
	27561yVVeYP2UXDSz1uHKdURSO63Ob4QEltIgMYIcri3J1Ir1f9yb7YCzLNk+MkFNhpx
	h/b48HaVFuoSZQjKkWCxx7bHqzpSIZNfpWoW4/4DwBSd4P+7NNUTGRXrN/sKOzzBb0H/
	xnRw==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr20675984pax.43.1353531456037; Wed,
	21 Nov 2012 12:57:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 12:57:35 -0800 (PST)
In-Reply-To: <1353531361.10459.27.camel@ted>
References: <cover.1353490311.git.kai.kang@windriver.com>
	<bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
	<CAP9ODKoae1cD-qkN=VfSpLDRZO=yrcCXyhEmE+5+ZQbjahpU5w@mail.gmail.com>
	<1353519268.10459.22.camel@ted>
	<CAP9ODKp1gmCuvfnowtK2kyPajCOZoAS4b+0ocW0=-eNs1HUK8w@mail.gmail.com>
	<1353531361.10459.27.camel@ted>
Date: Wed, 21 Nov 2012 18:57:35 -0200
X-Google-Sender-Auth: lieIt6G5gIPKWyRnqJdDoIqAG90
Message-ID: <CAP9ODKpTfV_Lvi_0OhLrsGQxqSMwoqJjoR9yeCDkSkouV8ZqpA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] msmtp: add link to ${libdir}/sendmail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 21:11:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 6:56 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-11-21 at 15:37 -0200, Otavio Salvador wrote:
>> On Wed, Nov 21, 2012 at 3:34 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2012-11-21 at 09:28 -0200, Otavio Salvador wrote:
>> >> On Wed, Nov 21, 2012 at 7:38 AM, Kang Kai <kai.kang@windriver.com> wrote:
>> >> > LSB tests check file ${libdir}/sendmail, and the file was created by
>> >> > package lsbsetup. Because lsbsetup is dropped, create the link in msmtp.
>> >> >
>> >> > Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> >>
>> >> I think it is wrong. You should to use alternatives for it.
>> >
>> > Not necessarily, its not a file conflict problem, it just needs to exist
>> > at all...
>>
>> What if I want to use another smtp and still be lsb compliance?
>
> The issue is we already have the "sendmail" bindir entry under update
> alternatives control so this means adding an alternative of the
> alternative which I think is getting convoluted. Ideally this symlink
> just needs to exist which ever smtp is installed.
>
> So I think the better answer may be to move the link to the lsbtest
> suite, or some kind of lsb-collateral package.

This is a nicer solution indeed as this allow for reuse of same
solution among other packages.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


