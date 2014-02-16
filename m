Return-Path: <jcady92@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE4A6BD75
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 03:53:51 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id cm18so20393489qab.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 19:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WO2EQszCxUgtAy9MGamR1HcIUDDlHpURezybidBnagQ=;
	b=MOyU/JmFr3jJyeeFG93MR+6XJy29MPQwGlIaOSVPkSfrl3Um8ytMWr3bkz+4egU4bS
	jbrOn00mDKKe2X0DQ1nyI3G2wiAlAEDajJgCLudzfa5Qd6Se6AN7LnyqrrZWBj8JOwuE
	eJKkWCQl9QTMJYRizn7DeyXgqjH4OTnAmb+4b5AXMH5ucH6juT8n3d+V57ILZBi4Wl9m
	uYRChZuvmD+TsYe/VzzW+n7XUbd1Rb9PQF1x07+1vjzV6eKK2O84VInXaV3lvrXga9lX
	MUTLXebcAjDHxSev6Ohnyje+MBdBEg+wWn076MW/6QvtQZ6DdwzI4W2b+Oo9g4EskdMc
	vzVA==
X-Received: by 10.140.88.112 with SMTP id s103mr24498027qgd.47.1392522831910; 
	Sat, 15 Feb 2014 19:53:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.46.3 with HTTP; Sat, 15 Feb 2014 19:53:31 -0800 (PST)
In-Reply-To: <97399D49-FAF4-45E0-9AF2-EDF60A6CE258@gmail.com>
References: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
	<A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
	<CANP1U1z1d5CDar_NLDmnVX+EZJYfMnxbATip1_ejfe4E18pFVQ@mail.gmail.com>
	<17C2FD1E-6342-4B44-B597-9960E0E4A20D@gmail.com>
	<CANP1U1yJcXoGOymmMfa7wm4TOTD0TCCJxLE-L2NjddqH9RNXQw@mail.gmail.com>
	<97399D49-FAF4-45E0-9AF2-EDF60A6CE258@gmail.com>
From: Jay Cady <jcady92@gmail.com>
Date: Sat, 15 Feb 2014 22:53:31 -0500
Message-ID: <CANP1U1xz1_KVFRQ=ujhy72jCTLVXmNwweN6LSjzqzKmn4OmxHg@mail.gmail.com>
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
X-List-Received-Date: Sun, 16 Feb 2014 03:53:51 -0000
Content-Type: multipart/alternative; boundary=001a11c117cebcdd7104f27dfcb8

--001a11c117cebcdd7104f27dfcb8
Content-Type: text/plain; charset=ISO-8859-1

I can confirm that the runtime error is gone.  Qt5 images now run as
expected.


On Sat, Feb 15, 2014 at 10:52 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Feb 15, 2014, at 7:46 PM, Jay Cady <jcady92@gmail.com> wrote:
>
> I re-did the patch correctly and it works perfectly!  Problem solved.
>
>
>
> Can you reconfirm that runtime error on your target is gone now ?
> I would like others who have been seeing this issue to test this patch out
> as well
> since I don't have the runtime env myself here. And then I will propose
> the fix for inclusion into OE-Core
>
>
> For others wondering, these were the steps Khem gave me to apply the patch:
>
> cd into meta/
> and then
>
> wget
> http://git.openembedded.org/openembedded-core-contrib/patch/?id=07ff1b539a62053c6d41cd2814e8d0bca1991a63 -O
> a.patch
> git am a.patch
>
> Thanks Khem!
>
>
> On Sat, Feb 15, 2014 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> On Feb 15, 2014, at 4:52 PM, Jay Cady <jcady92@gmail.com> wrote:
>>
>> Hey, thanks for the reply!
>>
>> I tried it out and wasn't able to boot the image.  Here is the output of
>> the boot when it failed:
>>
>>
>> Its not the patch. your image seems corrupt.
>>
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
>>
>> Any ideas why this is happening?  Perhaps I installed the patch
>> incorrectly?
>>
>>
>> On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Hi
>>>
>>> can you try this patch
>>>
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/icu&id=07ff1b539a62053c6d41cd2814e8d0bca1991a63
>>>
>>> and report back
>>>
>>> -Khem
>>>
>>>
>>>
>>> On Feb 15, 2014, at 9:57 AM, Jay Cady <jcady92@gmail.com> wrote:
>>>
>>> I'm having the exact same problem.
>>>
>>> Latest master branch of Yocto 1.5 2/13/14.  Built with the master branch
>>> of meta-qt5.  Wandboard-dual.
>>>
>>> When running the Qt5_CinematicExperience app, I'm getting this error:
>>>
>>> shared libraries: /usr/lib/libicudata.so.51: internal error
>>>
>>> Any ideas how to fix this?
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>
>>
>
>

--001a11c117cebcdd7104f27dfcb8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can confirm that the runtime error is gone. &nbsp;Qt5 im=
ages now run as expected.</div><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On Sat, Feb 15, 2014 at 10:52 PM, Khem Raj <span dir=3D"l=
tr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gm=
ail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><br><div=
><div class=3D""><div>On Feb 15, 2014, at 7:46 PM, Jay Cady &lt;<a href=3D"=
mailto:jcady92@gmail.com" target=3D"_blank">jcady92@gmail.com</a>&gt; wrote=
:</div>

<br><blockquote type=3D"cite"><div dir=3D"ltr">I re-did the patch correctly=
 and it works perfectly! &nbsp;Problem solved.<div><br></div></div></blockq=
uote><div><br></div><div><br></div></div><div>Can you reconfirm that runtim=
e error on your target is gone now ?</div>

<div>I would like others who have been seeing this issue to test this patch=
 out as well</div><div>since I don&rsquo;t have the runtime env myself here=
. And then I will propose the fix for inclusion into OE-Core</div><div><div=
 class=3D"h5">

<div><br></div><div><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><d=
iv>For others wondering, these were the steps Khem gave me to apply the pat=
ch:</div><div><br></div><div><div style=3D"font-family:arial,sans-serif;fon=
t-size:13px">



cd into meta/</div><div style=3D"font-family:arial,sans-serif;font-size:13p=
x">and then&nbsp;</div><div style=3D"font-family:arial,sans-serif;font-size=
:13px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13px"=
><div style=3D"margin:0px;font-family:&#39;PT Mono&#39;">



wget&nbsp;<a href=3D"http://git.openembedded.org/openembedded-core-contrib/=
patch/?id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63" target=3D"_blank">htt=
p://git.openembedded.org/openembedded-core-contrib/patch/?id=3D07ff1b539a62=
053c6d41cd2814e8d0bca1991a63</a>&nbsp;-O a.patch</div>



</div><div style=3D"font-family:arial,sans-serif;font-size:13px">git am a.p=
atch</div><div><br></div><div>Thanks Khem!</div></div></div><div class=3D"g=
mail_extra"><br><br><div class=3D"gmail_quote">On Sat, Feb 15, 2014 at 7:54=
 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>



<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><br><div=
><div><div>On Feb 15, 2014, at 4:52 PM, Jay Cady &lt;<a href=3D"mailto:jcad=
y92@gmail.com" target=3D"_blank">jcady92@gmail.com</a>&gt; wrote:</div>



<br><blockquote type=3D"cite"><div dir=3D"ltr"><div>Hey, thanks for the rep=
ly!</div><div><br></div>I tried it out and wasn&#39;t able to boot the imag=
e. &nbsp;Here is the output of the boot when it failed:<div><br></div></div=
></blockquote>



<div><br></div></div><div>Its not the patch. your image seems corrupt.&nbsp=
;</div><div><div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div><div>[=
 &nbsp; &nbsp;3.230529] Freeing init memory: 180K</div>


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






</div><div><br></div><div>Any ideas why this is happening? &nbsp;Perhaps I =
installed the patch incorrectly?</div><div class=3D"gmail_extra"><br><br><d=
iv class=3D"gmail_quote">On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <span di=
r=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;</span> wrote:<br>






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
2/13/14. &nbsp;Built with the master branch of meta-qt5. &nbsp;Wandboard-du=
al.</div>






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
</blockquote></div></div></div><br></div></blockquote></div><br></div>

--001a11c117cebcdd7104f27dfcb8--
