Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Sc1Dz-0007rm-No
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 23:23:37 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 05 Jun 2012 14:13:07 -0700
Received: by lahj13 with SMTP id j13so3670359lah.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2012 14:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=VtN/bKSDa14/Iu3H6IpgLwr1QjuHV0N7kljpSr3Xo98=;
	b=JjfKJfjeJGME8ygerN/htXj8epFoC+NI4+eEefByZSo/1rWMU/l6Q2g3HhYFwyZPBM
	uatMmiw2qMQDtp09rBMfeapl6YsVqx2fy4DPhkdAhpRFos9q253T35JxfTapdXX8umhC
	cMV/WyUSo3ZOD339Cwl8xnv7/7vW/Ypehi+03vWB01S+1AHQs/nTOeg8iWVbR6qeD87T
	ARxQRfHWflC2gQZYU7dkFCbufZET5ovrrJqIQp/rCCnDZmkZQjCa2WX+hKamNIn5+k9m
	IxBDgPXA74398Wytd8ePV05Bzq/1/6yp6wcYxtPAryQZlo3rdYGkWf68NrsoZCHXPZ5+
	UWfQ==
MIME-Version: 1.0
Received: by 10.112.36.42 with SMTP id n10mr8779533lbj.7.1338930785648; Tue,
	05 Jun 2012 14:13:05 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Tue, 5 Jun 2012 14:13:05 -0700 (PDT)
In-Reply-To: <4FCE7307.4020008@windriver.com>
References: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
	<CAPhnLPBktoKn7UJKahYpWwf56CzRDZPjGdoh1nH1t5z6F5DwGw@mail.gmail.com>
	<4FCE7307.4020008@windriver.com>
Date: Tue, 5 Jun 2012 14:13:05 -0700
Message-ID: <CAPhnLPBAmVFTKfhJSTWW4SzAU5owc0C-h2pu8hfsqPNZkQAQvQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
X-Gm-Message-State: ALoCoQngjO/0tMHjTk9VY6ljVcm+M2/Xpuc4UmPNG4w/IRuvk87y/zEVlybcu5rY19c1J5eUfPPg
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] perl: Allow perl to cross build and native build in a directory named "t"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2012 21:23:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 5, 2012 at 1:58 PM, Jason Wessel <jason.wessel@windriver.com> w=
rote:
> On 06/05/2012 03:25 PM, Flanagan, Elizabeth wrote:
>> On Mon, Jun 4, 2012 at 11:47 AM, Jason Wessel
>> <jason.wessel@windriver.com> wrote:
>>> If any directory in leading up to your tmp directory has the name "t"
>>> perl will fail to build with a very cryptic error shown below:
>>
>>
>> Jason,
>>
>> I'm currently testing this patch and it seems to be causing failures
>> during do_compile for poky-tiny
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/71=
/steps/shell_35/logs/stdio
>>
>> | /bin/ln -s perldelta.pod pod/perl5142delta.pod
>> | ./miniperl -Ilib autodoc.pl
>> | make[1]: ./miniperl: Command not found
>> | make[1]: *** [pod/perlintern.pod] Error 127
>> | make[1]: Leaving directory
>> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-tiny/build/bu=
ild/tmp/work/i586-poky-linux/perl-5.14.2-r7/perl-5.14.2'
>> | make: *** [perl] Error 2
>> | ERROR: oe_runmake failed
>
>
> Did this work before the patch was applied?
>

Ah, my mistake. This is actually an issue in master.

> If miniperl cannot be found it usually indicates some other kind of other=
 perl configuration problem.
>
> How do you setup poky-tiny? =A0The http URL you pointed me to doesn't hav=
e the local.conf in it. =A0Or is it the case you set those environment vari=
ables and then try to execute a build?
>
> Thanks,
> Jason.



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


