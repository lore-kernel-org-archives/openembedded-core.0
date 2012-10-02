Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJ3Cy-0002sa-4K
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 16:12:24 +0200
Received: by padfa11 with SMTP id fa11so5304141pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=WvL+PboMgntb+NNsxfiNkcZLzlGA2+CQ8KcSyHqQiwA=;
	b=s7OUSQvGmoYt9fM6lLJTKdKtQMsK4jJW+QQBnP6bMR4m92cm68U3RB8ZwlHoqzTn1O
	PI9Brh6x/i4qjfqyg2HkcN2Tegm90lOawjFBO2fOvoADa6VzsQ4EMs9RgbhG7fu7Ex3h
	dd4y5WR3LgZUptUbbDV4CEn1pKt+IBV6GsRGCbV4798GCXIAlATncYllNt9T+omYAm3V
	WySuShTdTNY2GpPQJ8loZcsg2emVqgDmrNOw2rAFHLAVBDwgRB085A7rfHUdhBQp0haQ
	fiZ2OKJT4MLmIvpK4x7NgjUgj0q7O9z4RYGSTnEzy+qlzdzKEEJ8acmOT3+5GF5XLS9G
	3z9g==
MIME-Version: 1.0
Received: by 10.68.224.133 with SMTP id rc5mr4385655pbc.130.1349186365113;
	Tue, 02 Oct 2012 06:59:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 2 Oct 2012 06:59:25 -0700 (PDT)
In-Reply-To: <506AF195.9040008@cisco.com>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<CAP9ODKqk-xe4vgx1aLJKgnceBU5Ds3RGKCZYkEo3sCKc4OGZaQ@mail.gmail.com>
	<1349185900.32611.88.camel@phil-desktop>
	<CAP9ODKp3H99BCS3k0K890Eb6xtM2_8Toph4T2=Q1yNvZK5XeLQ@mail.gmail.com>
	<506AF195.9040008@cisco.com>
Date: Tue, 2 Oct 2012 10:59:25 -0300
X-Google-Sender-Auth: L6aCdoLEUQuUPRYniXhAPN7BXsA
Message-ID: <CAP9ODKrUDoCMHf7JX6g8r_PQgQypNTcZ_3T9=+Y=9D5D9_rmWQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 14:12:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 2, 2012 at 10:52 AM, Martin Erts=E5s <mertsas@cisco.com> wrote:
> On 10/02/12 15:53, Otavio Salvador wrote:
>> On Tue, Oct 2, 2012 at 10:51 AM, Phil Blundell <philb@gnu.org> wrote:
>>> On Tue, 2012-10-02 at 10:42 -0300, Otavio Salvador wrote:
>>>> Or IMAGE_FEATURES +=3D "dbg-img" ;-)
>>> Where is that implemented?  I couldn't find any obvious reference to
>>> dbg-img in any classes.
>> Sorry by cause a missunderstanding ... I was just pointing to a
>> possible new feature you could add.
>>
> that feature is already implemented though, in dbg-pkgs. If you don't
> mean dbg-img should do something other/more than what dbg-pkgs does?

To build a separated tar with the symbols, not on the image itself.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


