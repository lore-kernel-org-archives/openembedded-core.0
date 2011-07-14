Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QhJaM-0001Xd-OR
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 12:56:02 +0200
Received: by wwi18 with SMTP id 18so187256wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OqLtuJMMdoF+52POdOA0Bava7/eCJre9+TrQtdBVn48=;
	b=WXpb1xCMfFQiFitZVOZznmxmbPaZJxpxYrkmEQ+WvNSemUNYocQDk8B66AZb5Zb42E
	9QCF2SkEZMq7r/HaLXhgnuDewfnOhS1QdHwTgFO9RjIQjwqaWsVb2VnkWQZQGexM3K/9
	Lu9LvkvWZTLGMEy0K/FQaFbR7wzLZDk1YJ7tE=
MIME-Version: 1.0
Received: by 10.216.137.4 with SMTP id x4mr6215342wei.53.1310640723390; Thu,
	14 Jul 2011 03:52:03 -0700 (PDT)
Received: by 10.216.176.149 with HTTP; Thu, 14 Jul 2011 03:52:03 -0700 (PDT)
In-Reply-To: <CAGiJk9c8C8-8hgBxMVtPmY3QK4tVRs-3KVxmy7qAopHQB1Ba1w@mail.gmail.com>
References: <CAGiJk9epBnpXunG0nJGyJUvBfcm6w3XK2RxCEU-CkACwdnAqag@mail.gmail.com>
	<19B4D9B5-F086-47C4-8817-94DC7D6A6CB6@dominion.thruhere.net>
	<201107141033.53014.paul.eggleton@linux.intel.com>
	<CAGiJk9c8C8-8hgBxMVtPmY3QK4tVRs-3KVxmy7qAopHQB1Ba1w@mail.gmail.com>
Date: Thu, 14 Jul 2011 12:52:03 +0200
Message-ID: <CAGiJk9eu9k7u8FZ9GPz9y2Fz9ZCHcoHUKjBdNLrxGFt1RT89Sg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: koen@dominion.thruhere.net, paul.eggleton@linux.intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Error running bitbake with a fresh copy of OE-Core
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
X-List-Received-Date: Thu, 14 Jul 2011 10:56:02 -0000
Content-Type: multipart/alternative; boundary=0016e6d64684bef32404a8055260

--0016e6d64684bef32404a8055260
Content-Type: text/plain; charset=ISO-8859-1

2011/7/14 Samuel Stirtzel <s.stirtzel@googlemail.com>

>
>
> 2011/7/14 Paul Eggleton <paul.eggleton@linux.intel.com>
>
>> On Thursday 14 July 2011 10:25:28 Koen Kooi wrote:
>> > Op 14 jul 2011, om 10:52 heeft Samuel Stirtzel het volgende geschreven:
>> > > File name too long:
>> > >
>> '/home/*user*/oe-core/setup-scripts/build/sstate-cache/sstate-gcc-cross-
>> > >
>> initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0+svnr175127-x86_64_armv5t
>> > > e-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.tgz.siginfo'
>> >
>> > That seems to be filesystem related, I know ext3, ext4 and xfs work
>> fine,
>> > which one are you using?
>>
>> ecryptfs (encrypted home directory) perhaps? I thought we had a check for
>> long
>> filename creation in sanity.bbclass, maybe it isn't being tripped here for
>> some
>> reason...
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>
> The filesystem of this pc is ext4 with encrypted home directory, so moving
> my OE-Core directory out of my home directory could resolve my problems?
> I will try this and write back if it worked.
>
>
> Regards
> --Samuel
>

After moving the directory and changing the config files and the
~/.oe/environment-oecore script accordingly, Bitbake is now running smoothly
and the error disappeared.
Thank you for helping me with this problem.



Regards
--Samuel

--0016e6d64684bef32404a8055260
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/14 Samuel Stirtzel <span dir=3D"l=
tr">&lt;<a href=3D"mailto:s.stirtzel@googlemail.com">s.stirtzel@googlemail.=
com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div><div></div><div class=3D"h5"><br><br><div class=3D"gmail_quote">2011/7=
/14 Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@lin=
ux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span=
><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">

<div>On Thursday 14 July 2011 10:25:28 Koen Kooi wrote:<br>
&gt; Op 14 jul 2011, om 10:52 heeft Samuel Stirtzel het volgende geschreven=
:<br>
&gt; &gt; File name too long:<br>
&gt; &gt; &#39;/home/*user*/oe-core/setup-scripts/build/sstate-cache/sstate=
-gcc-cross-<br>
&gt; &gt; initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0+svnr175127-x86_6=
4_armv5t<br>
&gt; &gt; e-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.tgz.siginfo&#39=
;<br>
&gt;<br>
&gt; That seems to be filesystem related, I know ext3, ext4 and xfs work fi=
ne,<br>
&gt; which one are you using?<br>
<br>
</div>ecryptfs (encrypted home directory) perhaps? I thought we had a check=
 for long<br>
filename creation in sanity.bbclass, maybe it isn&#39;t being tripped here =
for some<br>
reason...<br><br></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Cheers,<br>
Paul<br>
<font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></blockquote></div><div><br></div></div></div><div>The filesystem of=
 this pc is ext4 with encrypted home directory, so moving my OE-Core direct=
ory out of my home directory could resolve my problems?</div>
<div>I will try this and write back if it worked.</div><div><br></div><div>=
<br></div><div>Regards</div><div>--Samuel</div>
</blockquote></div><br><div>After moving the directory and changing the con=
fig files and the ~/.oe/environment-oecore script accordingly, Bitbake is n=
ow running smoothly and the error disappeared.</div><div>Thank you for help=
ing me with this problem.</div>
<div><br></div><div><br></div><div><br></div><div>Regards</div><div>--Samue=
l</div>

--0016e6d64684bef32404a8055260--
