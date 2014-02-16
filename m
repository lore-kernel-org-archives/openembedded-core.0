Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 021776BC8C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 03:52:12 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id v10so13576722pde.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 19:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=gaKOCQRWcojecvsbXHNNg63iiI95fWR3Kdq87b8Cd6c=;
	b=ZF4/+WsxcwSk8WgpW5YwR1Yq3rcLYk8hQHtAKW1dK5N4aWUYlwvOOJjZulPJILsrha
	JVdCHLqwH/v6E3pdLRM9stZC98EwpDuewFmXZ5WtFDddb7a9utSuGj3IodduYm93gHf8
	Q5I/hFdsQhcCVwnRgTcB1OgelUWnSM3ZHB61CQ1rEg7Gb93pChzZeKR8n7c5R4Cj5c9i
	uFIEivJG8HyZQDcsw3G/AKyH1jGCadE5WtodySWUi50yFBCIiBqsdvHLzC/DxpTemOBn
	exNNhkvQwDuotzvqCntMlYLlcHO8hHHt6VP6WmAOGyrgglt3sSXtkVbaO59qttSCh+i7
	lUEQ==
X-Received: by 10.67.5.233 with SMTP id cp9mr46499pad.147.1392522733988;
	Sat, 15 Feb 2014 19:52:13 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	eo11sm81625938pac.0.2014.02.15.19.52.12 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Feb 2014 19:52:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANP1U1yJcXoGOymmMfa7wm4TOTD0TCCJxLE-L2NjddqH9RNXQw@mail.gmail.com>
Date: Sat, 15 Feb 2014 19:52:11 -0800
Message-Id: <97399D49-FAF4-45E0-9AF2-EDF60A6CE258@gmail.com>
References: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
	<A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
	<CANP1U1z1d5CDar_NLDmnVX+EZJYfMnxbATip1_ejfe4E18pFVQ@mail.gmail.com>
	<17C2FD1E-6342-4B44-B597-9960E0E4A20D@gmail.com>
	<CANP1U1yJcXoGOymmMfa7wm4TOTD0TCCJxLE-L2NjddqH9RNXQw@mail.gmail.com>
To: Jay Cady <jcady92@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with libicudata.so in OE master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Feb 2014 03:52:13 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_34195D81-2661-499B-9A25-052447E2E5AC"

--Apple-Mail=_34195D81-2661-499B-9A25-052447E2E5AC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Feb 15, 2014, at 7:46 PM, Jay Cady <jcady92@gmail.com> wrote:

> I re-did the patch correctly and it works perfectly!  Problem solved.
>=20


Can you reconfirm that runtime error on your target is gone now ?
I would like others who have been seeing this issue to test this patch =
out as well
since I don=92t have the runtime env myself here. And then I will =
propose the fix for inclusion into OE-Core


> For others wondering, these were the steps Khem gave me to apply the =
patch:
>=20
> cd into meta/
> and then=20
>=20
> wget =
http://git.openembedded.org/openembedded-core-contrib/patch/?id=3D07ff1b53=
9a62053c6d41cd2814e8d0bca1991a63 -O a.patch
> git am a.patch
>=20
> Thanks Khem!
>=20
>=20
> On Sat, Feb 15, 2014 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> On Feb 15, 2014, at 4:52 PM, Jay Cady <jcady92@gmail.com> wrote:
>=20
>> Hey, thanks for the reply!
>>=20
>> I tried it out and wasn't able to boot the image.  Here is the output =
of the boot when it failed:
>>=20
>=20
> Its not the patch. your image seems corrupt.=20
>=20
>> [    3.230529] Freeing init memory: 180K
>> INIT: version 2.88 booting
>> INIT: Entering runlevel: 5
>> INIT: cannot execute "/etc/init.d/rc"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT:
>> cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT:
>> cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: Id "mxc0" respawning too fast: disabled for 5 minutes
>> INIT: cannot execute "/sbin/getty"
>> INIT: cannot execute "/sbin/getty"
>> INIT: Id "1" respawning too fast: disabled for 5 minutes
>> INIT: no more processes left in this runlevel
>>=20
>> Any ideas why this is happening?  Perhaps I installed the patch =
incorrectly?
>>=20
>>=20
>> On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>=20
>> can you try this patch
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu=
&id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63
>>=20
>> and report back
>>=20
>> -Khem
>>=20
>>=20
>>=20
>> On Feb 15, 2014, at 9:57 AM, Jay Cady <jcady92@gmail.com> wrote:
>>=20
>>> I'm having the exact same problem.
>>>=20
>>> Latest master branch of Yocto 1.5 2/13/14.  Built with the master =
branch of meta-qt5.  Wandboard-dual.
>>>=20
>>> When running the Qt5_CinematicExperience app, I'm getting this =
error:
>>>=20
>>> shared libraries: /usr/lib/libicudata.so.51: internal error
>>>=20
>>> Any ideas how to fix this?
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>>=20
>=20
>=20


--Apple-Mail=_34195D81-2661-499B-9A25-052447E2E5AC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;"><br><div><div>On Feb 15, 2014, at 7:46 PM, Jay Cady =
&lt;<a href=3D"mailto:jcady92@gmail.com">jcady92@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr">I re-did the patch correctly and it works =
perfectly! &nbsp;Problem =
solved.<div><br></div></div></blockquote><div><br></div><div><br></div><di=
v>Can you reconfirm that runtime error on your target is gone now =
?</div><div>I would like others who have been seeing this issue to test =
this patch out as well</div><div>since I don=92t have the runtime env =
myself here. And then I will propose the fix for inclusion into =
OE-Core</div><div><br></div><div><br></div><blockquote type=3D"cite"><div =
dir=3D"ltr"><div>For others wondering, these were the steps Khem gave me =
to apply the patch:</div><div><br></div><div><div =
style=3D"font-family:arial,sans-serif;font-size:13px">

cd into meta/</div><div =
style=3D"font-family:arial,sans-serif;font-size:13px">and =
then&nbsp;</div><div =
style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div =
style=3D"font-family:arial,sans-serif;font-size:13px"><div =
style=3D"margin:0px;font-family:'PT Mono'">

wget&nbsp;<a =
href=3D"http://git.openembedded.org/openembedded-core-contrib/patch/?id=3D=
07ff1b539a62053c6d41cd2814e8d0bca1991a63" =
target=3D"_blank">http://git.openembedded.org/openembedded-core-contrib/pa=
tch/?id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63</a>&nbsp;-O =
a.patch</div>

</div><div style=3D"font-family:arial,sans-serif;font-size:13px">git am =
a.patch</div><div><br></div><div>Thanks Khem!</div></div></div><div =
class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sat, Feb 15, =
2014 at 7:54 PM, Khem Raj <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"word-wrap:break-word"><br><div><div class=3D""><div>On Feb 15, =
2014, at 4:52 PM, Jay Cady &lt;<a href=3D"mailto:jcady92@gmail.com" =
target=3D"_blank">jcady92@gmail.com</a>&gt; wrote:</div>

<br><blockquote type=3D"cite"><div dir=3D"ltr"><div>Hey, thanks for the =
reply!</div><div><br></div>I tried it out and wasn't able to boot the =
image. &nbsp;Here is the output of the boot when it =
failed:<div><br></div></div></blockquote>

<div><br></div></div><div>Its not the patch. your image seems =
corrupt.&nbsp;</div><div><div class=3D"h5"><br><blockquote =
type=3D"cite"><div dir=3D"ltr"><div><div>[ &nbsp; &nbsp;3.230529] =
Freeing init memory: 180K</div>


<div>INIT: version 2.88 booting</div><div>INIT: Entering runlevel: =
5</div><div>INIT: cannot execute "/etc/init.d/rc"</div><div>INIT: cannot =
execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div>




<div>INIT:</div><div>cannot execute "/sbin/getty"</div><div>INIT: cannot =
execute "/sbin/getty"</div><div>INIT: cannot execute =
"/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div>




<div>INIT: cannot execute "/sbin/getty"</div><div>INIT:</div><div>cannot =
execute "/sbin/getty"</div><div>INIT: cannot execute =
"/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div>




<div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute =
"/sbin/getty"</div><div>INIT: cannot execute =
"/sbin/getty"</div><div>INIT: Id "mxc0" respawning too fast: disabled =
for 5 minutes</div>




<div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute =
"/sbin/getty"</div><div>INIT: Id "1" respawning too fast: disabled for 5 =
minutes</div><div>INIT: no more processes left in this runlevel</div>




</div><div><br></div><div>Any ideas why this is happening? &nbsp;Perhaps =
I installed the patch incorrectly?</div><div =
class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sat, Feb 15, =
2014 at 5:14 PM, Khem Raj <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>




<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"word-wrap:break-word">Hi<div><br></div><div>can you try this =
patch</div><div><br></div><div><a =
href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=3D=
kraj/icu&amp;id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63" =
target=3D"_blank">http://git.openembedded.org/openembedded-core-contrib/co=
mmit/?h=3Dkraj/icu&amp;id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63</a></=
div>




<div><br></div><div>and report =
back</div><div><br></div><div>-Khem</div><div><br></div><div><br></div><di=
v><br><div><div><div>On Feb 15, 2014, at 9:57 AM, Jay Cady &lt;<a =
href=3D"mailto:jcady92@gmail.com" =
target=3D"_blank">jcady92@gmail.com</a>&gt; wrote:</div>




<br></div><blockquote type=3D"cite"><div><div dir=3D"ltr">I'm having the =
exact same problem.<div><br></div><div>Latest master branch of Yocto 1.5 =
2/13/14. &nbsp;Built with the master branch of meta-qt5. =
&nbsp;Wandboard-dual.</div>




<div><br></div><div>When running the Qt5_CinematicExperience app, I'm =
getting this error:</div>

<div><br></div><div>shared libraries: /usr/lib/libicudata.so.51: =
internal error</div><div><br></div><div>Any ideas how to fix =
this?</div></div></div>
_______________________________________________<br>Openembedded-core =
mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembed=
ded-core</a><br>




</blockquote></div><br></div></div></blockquote></div><br></div></div>
</blockquote></div></div></div><br></div></blockquote></div><br></div>
</blockquote></div><br></body></html>=

--Apple-Mail=_34195D81-2661-499B-9A25-052447E2E5AC--
