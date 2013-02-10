Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U4YZ6-0004RM-Hd
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 16:11:37 +0100
Received: by mail-wg0-f44.google.com with SMTP id dr12so4031306wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2013 06:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XJWN+FMnHSrmX2iSqHc7ZjXWUewhRs04aQzzMQPO52M=;
	b=yTgz6EMyjt2CYV59fyYZT0c39ahaRl4NPgBjwxHLhREaG45cpNgTUNObNknD91kG6u
	VmzSFpSjWNsQBPqq5BA8B+Lc6FWI8sPy9S7gHTNjOTdp0DE8QaxIuGYLA1uK/p40e4Ib
	3Mr/8oAQivPr3v/PfYCUVQ1D3qZKCt8fg89VY3e/9Y36VYlVBIGEAKO1OLhdLIKbUHoB
	ap5exCmgpe72/1TaEuewHRPh2ZhhCaCKlKpy60ePkKtl89VbXqfKfhhn81yltZqCjs+5
	Ot1rFZlvO69LD6EDoWjl3indNciGwa6lNzITLdOPG1MIrCimgVNvcZz6cAMB48ejHFUT
	g7mQ==
MIME-Version: 1.0
X-Received: by 10.181.12.103 with SMTP id ep7mr11366130wid.12.1360508139588;
	Sun, 10 Feb 2013 06:55:39 -0800 (PST)
Received: by 10.194.179.39 with HTTP; Sun, 10 Feb 2013 06:55:39 -0800 (PST)
In-Reply-To: <5116A5DA.90500@topic.nl>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
Date: Sun, 10 Feb 2013 15:55:39 +0100
Message-ID: <CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple MACHINE building is broken in OE-core?
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
X-List-Received-Date: Sun, 10 Feb 2013 15:11:37 -0000
Content-Type: multipart/alternative; boundary=f46d0438eddb5fcc2c04d55ffc7c

--f46d0438eddb5fcc2c04d55ffc7c
Content-Type: text/plain; charset=UTF-8

use sstate-diff-machines.sh



On Sat, Feb 9, 2013 at 8:39 PM, Mike Looijmans <mike.looijmans@topic.nl>wrote:

> On 02/01/2013 01:59 PM, Mike Looijmans wrote:
>
>> On 02/01/2013 11:29 AM, Burton, Ross wrote:
>>
>>> On 1 February 2013 07:51, Mike Looijmans <mike.looijmans@topic.nl>
>>> wrote:
>>>
>>>> A concrete example might help.
>>>>>
>>>>
>>>> Would be glad to comply, if you care to explain what you need. What
>>>> should I
>>>> do, which logging to collect (and maybe how)?
>>>>
>>>
>>> To start with just the two machines you are changing between and the
>>> packages/tasks that are re-ran.
>>>
>>
> Well, here's an example of me switching from "vusolo2" to "et9x00" in the
> current state of OE. I'm migrating this from a year-old or so state of
> OE-core to the present.
>
> On the "old" system (not "classic" openembedded, just a much older
> oe-core!) switching would result in just immediately building rootfs, and
> nothing more.
>
> Now when I change MACHINE from one to the other, after just having built,
> it runs hundreds of tasks, and it takes a few minutes to do all that.
>
> $ export MACHINE=et9x00
> $ bitbake my-image
> $ export MACHINE=vusolo2
> $ bitbake my-image > /tmp/bitbake.log
> $ export MACHINE=et9x00
> $ bitbake my-image > /tmp/bitbake.log
>
> I've attached the two log files.
>
> WHY is it doing all that? None of these packages are machine specific!
> --
> Mike Looijmans - Topic Automation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--f46d0438eddb5fcc2c04d55ffc7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">use sstate-diff-machines.sh<br><br></div><div class=3D"gma=
il_extra"><br><br><div class=3D"gmail_quote">On Sat, Feb 9, 2013 at 8:39 PM=
, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"mailto:mike.looijmans@top=
ic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 02/01/2013 01:59 PM, Mi=
ke Looijmans wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 02/01/2013 11:29 AM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 1 February 2013 07:51, Mike Looijmans &lt;<a href=3D"mailto:mike.looijma=
ns@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
A concrete example might help.<br>
</blockquote>
<br>
Would be glad to comply, if you care to explain what you need. What<br>
should I<br>
do, which logging to collect (and maybe how)?<br>
</blockquote>
<br>
To start with just the two machines you are changing between and the<br>
packages/tasks that are re-ran.<br>
</blockquote></blockquote>
<br></div>
Well, here&#39;s an example of me switching from &quot;vusolo2&quot; to &qu=
ot;et9x00&quot; in the current state of OE. I&#39;m migrating this from a y=
ear-old or so state of OE-core to the present.<br>
<br>
On the &quot;old&quot; system (not &quot;classic&quot; openembedded, just a=
 much older oe-core!) switching would result in just immediately building r=
ootfs, and nothing more.<br>
<br>
Now when I change MACHINE from one to the other, after just having built, i=
t runs hundreds of tasks, and it takes a few minutes to do all that.<br>
<br>
$ export MACHINE=3Det9x00<br>
$ bitbake my-image<br>
$ export MACHINE=3Dvusolo2<br>
$ bitbake my-image &gt; /tmp/bitbake.log<br>
$ export MACHINE=3Det9x00<br>
$ bitbake my-image &gt; /tmp/bitbake.log<br>
<br>
I&#39;ve attached the two log files.<br>
<br>
WHY is it doing all that? None of these packages are machine specific!<span=
 class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
Mike Looijmans - Topic Automation<br>
</font></span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br></div>

--f46d0438eddb5fcc2c04d55ffc7c--
