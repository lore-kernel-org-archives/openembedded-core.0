Return-Path: <jcady92@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id A6E2D6B916
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 03:46:24 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so3243688qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 19:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JRnc70xox37bc47kI9eId0m9qDgLPYzLCViUSZMdHWI=;
	b=Jnt72ALQKButi7gn9KWevVtf08Wu6KjXaRBI41HCol60SiFaGA8QKtcJVNf0D6Jqrf
	z8D1VJ52xL7YD5OBiSDOxrwB9mwTNK2y2Rvl8OA+IkkrgMqkQg85qCKsAJBqzrjRLRoP
	cZtY92Ok4s/qGNm6zL/tjdyW1fi7Vb486pdAynFfL6t9d4+efjFAsfsLoJU13ApgJATH
	q6oE1G5K6yQbYY+hVrKKxCwEDKPYtvZxQbCTvlVqNLwP2zDdYHmnwZWRdLJ8JPvSXMnt
	VypJuGvouIqT5X46w+zHKSp+cZTOnyZSjcbQQMqB6SX5F+KcY4XIc7fB6W3mOGKtwA/+
	HMww==
X-Received: by 10.140.93.111 with SMTP id c102mr23828369qge.53.1392522385025; 
	Sat, 15 Feb 2014 19:46:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.46.3 with HTTP; Sat, 15 Feb 2014 19:46:04 -0800 (PST)
In-Reply-To: <17C2FD1E-6342-4B44-B597-9960E0E4A20D@gmail.com>
References: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
	<A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
	<CANP1U1z1d5CDar_NLDmnVX+EZJYfMnxbATip1_ejfe4E18pFVQ@mail.gmail.com>
	<17C2FD1E-6342-4B44-B597-9960E0E4A20D@gmail.com>
From: Jay Cady <jcady92@gmail.com>
Date: Sat, 15 Feb 2014 22:46:04 -0500
Message-ID: <CANP1U1yJcXoGOymmMfa7wm4TOTD0TCCJxLE-L2NjddqH9RNXQw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sun, 16 Feb 2014 03:46:24 -0000
Content-Type: multipart/alternative; boundary=001a1139b82819f1e704f27de2ba

--001a1139b82819f1e704f27de2ba
Content-Type: text/plain; charset=ISO-8859-1

I re-did the patch correctly and it works perfectly!  Problem solved.

For others wondering, these were the steps Khem gave me to apply the patch:

cd into meta/
and then

wget
http://git.openembedded.org/openembedded-core-contrib/patch/?id=07ff1b539a62053c6d41cd2814e8d0bca1991a63
-O
a.patch
git am a.patch

Thanks Khem!


On Sat, Feb 15, 2014 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Feb 15, 2014, at 4:52 PM, Jay Cady <jcady92@gmail.com> wrote:
>
> Hey, thanks for the reply!
>
> I tried it out and wasn't able to boot the image.  Here is the output of
> the boot when it failed:
>
>
> Its not the patch. your image seems corrupt.
>
> [    3.230529] Freeing init memory: 180K
> INIT: version 2.88 booting
> INIT: Entering runlevel: 5
> INIT: cannot execute "/etc/init.d/rc"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT:
> cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT:
> cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: Id "mxc0" respawning too fast: disabled for 5 minutes
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: Id "1" respawning too fast: disabled for 5 minutes
> INIT: no more processes left in this runlevel
>
> Any ideas why this is happening?  Perhaps I installed the patch
> incorrectly?
>
>
> On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi
>>
>> can you try this patch
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/icu&id=07ff1b539a62053c6d41cd2814e8d0bca1991a63
>>
>> and report back
>>
>> -Khem
>>
>>
>>
>> On Feb 15, 2014, at 9:57 AM, Jay Cady <jcady92@gmail.com> wrote:
>>
>> I'm having the exact same problem.
>>
>> Latest master branch of Yocto 1.5 2/13/14.  Built with the master branch
>> of meta-qt5.  Wandboard-dual.
>>
>> When running the Qt5_CinematicExperience app, I'm getting this error:
>>
>> shared libraries: /usr/lib/libicudata.so.51: internal error
>>
>> Any ideas how to fix this?
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>
>

--001a1139b82819f1e704f27de2ba
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I re-did the patch correctly and it works perfectly! =A0Pr=
oblem solved.<div><br></div><div>For others wondering, these were the steps=
 Khem gave me to apply the patch:</div><div><br></div><div><div style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">

cd into meta/</div><div style=3D"font-family:arial,sans-serif;font-size:13p=
x">and then=A0</div><div style=3D"font-family:arial,sans-serif;font-size:13=
px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px"><d=
iv style=3D"margin:0px;font-family:&#39;PT Mono&#39;">

wget=A0<a href=3D"http://git.openembedded.org/openembedded-core-contrib/pat=
ch/?id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63" target=3D"_blank">http:/=
/git.openembedded.org/openembedded-core-contrib/patch/?id=3D07ff1b539a62053=
c6d41cd2814e8d0bca1991a63</a>=A0-O a.patch</div>

</div><div style=3D"font-family:arial,sans-serif;font-size:13px">git am a.p=
atch</div><div><br></div><div>Thanks Khem!</div></div></div><div class=3D"g=
mail_extra"><br><br><div class=3D"gmail_quote">On Sat, Feb 15, 2014 at 7:54=
 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><br><div=
><div class=3D""><div>On Feb 15, 2014, at 4:52 PM, Jay Cady &lt;<a href=3D"=
mailto:jcady92@gmail.com" target=3D"_blank">jcady92@gmail.com</a>&gt; wrote=
:</div>

<br><blockquote type=3D"cite"><div dir=3D"ltr"><div>Hey, thanks for the rep=
ly!</div><div><br></div>I tried it out and wasn&#39;t able to boot the imag=
e. =A0Here is the output of the boot when it failed:<div><br></div></div></=
blockquote>

<div><br></div></div><div>Its not the patch. your image seems corrupt.=A0</=
div><div><div class=3D"h5"><br><blockquote type=3D"cite"><div dir=3D"ltr"><=
div><div>[ =A0 =A03.230529] Freeing init memory: 180K</div>


<div>INIT: version 2.88 booting</div><div>INIT: Entering runlevel: 5</div><=
div>INIT: cannot execute &quot;/etc/init.d/rc&quot;</div><div>INIT: cannot =
execute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/=
getty&quot;</div>




<div>INIT:</div><div>cannot execute &quot;/sbin/getty&quot;</div><div>INIT:=
 cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quo=
t;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/getty&quot;<=
/div>




<div>INIT: cannot execute &quot;/sbin/getty&quot;</div><div>INIT:</div><div=
>cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quo=
t;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/getty&quot;<=
/div>




<div>INIT: cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot ex=
ecute &quot;/sbin/getty&quot;</div><div>INIT: cannot execute &quot;/sbin/ge=
tty&quot;</div><div>INIT: Id &quot;mxc0&quot; respawning too fast: disabled=
 for 5 minutes</div>




<div>INIT: cannot execute &quot;/sbin/getty&quot;</div><div>INIT: cannot ex=
ecute &quot;/sbin/getty&quot;</div><div>INIT: Id &quot;1&quot; respawning t=
oo fast: disabled for 5 minutes</div><div>INIT: no more processes left in t=
his runlevel</div>




</div><div><br></div><div>Any ideas why this is happening? =A0Perhaps I ins=
talled the patch incorrectly?</div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br>




<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word">Hi<div><=
br></div><div>can you try this patch</div><div><br></div><div><a href=3D"ht=
tp://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu&am=
p;id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63" target=3D"_blank">http://g=
it.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu&amp;id=
=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63</a></div>




<div><br></div><div>and report back</div><div><br></div><div>-Khem</div><di=
v><br></div><div><br></div><div><br><div><div><div>On Feb 15, 2014, at 9:57=
 AM, Jay Cady &lt;<a href=3D"mailto:jcady92@gmail.com" target=3D"_blank">jc=
ady92@gmail.com</a>&gt; wrote:</div>




<br></div><blockquote type=3D"cite"><div><div dir=3D"ltr">I&#39;m having th=
e exact same problem.<div><br></div><div>Latest master branch of Yocto 1.5 =
2/13/14. =A0Built with the master branch of meta-qt5. =A0Wandboard-dual.</d=
iv>




<div><br></div><div>When running the Qt5_CinematicExperience app, I&#39;m g=
etting this error:</div>

<div><br></div><div>shared libraries: /usr/lib/libicudata.so.51: internal e=
rror</div><div><br></div><div>Any ideas how to fix this?</div></div></div>
_______________________________________________<br>Openembedded-core mailin=
g list<br><a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br><a href=3D"htt=
p://lists.openembedded.org/mailman/listinfo/openembedded-core" target=3D"_b=
lank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><=
br>




</blockquote></div><br></div></div></blockquote></div><br></div></div>
</blockquote></div></div></div><br></div></blockquote></div><br></div>

--001a1139b82819f1e704f27de2ba--
