Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 617217398C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 21:20:17 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so16220312igb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FCWwfQ9fuQGYNLsWCGoBotdvDby3Mkcm5eKfuMi2Qb8=;
	b=IMK9zUv0EliA7eImw/OD6YOn941it0Ft9PTzUPvww+eOog7x4V4Lhj5eXBAV19efgC
	HHBmYBugPZML7WU7KmkVz4pN1lMdTURZTMVbnYaSfx1uVt27SZDPvu2ypbIQ0Px+x1y7
	Jc/VKNMTznPIzKgLtM9R8mi0Ge6S2unDw/q44+y7HlWrC/HXDhvHCdsw9WPx69az5/lK
	ubgyernx8CTTvSYXk7wdyVrjcCbeHyNlyOGlp77peRT15vzEu0Nsi+w7bgv5oYT2bxKG
	DbM3gcdW9ZClUDAxj35kdDWCU74fuabOP/owygJ0HRNE6o9C5/ZLCX04KAeGfxA0+DLb
	l3dA==
MIME-Version: 1.0
X-Received: by 10.107.157.195 with SMTP id g186mr69521665ioe.72.1426108819077; 
	Wed, 11 Mar 2015 14:20:19 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Wed, 11 Mar 2015 14:20:18 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Wed, 11 Mar 2015 14:20:18 -0700 (PDT)
In-Reply-To: <CAJTo0LZ+voKVWoprGb=hpe3hi-mADqc=CMcSR1eFs5kk3QaTCw@mail.gmail.com>
References: <1426097234-10554-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZ+voKVWoprGb=hpe3hi-mADqc=CMcSR1eFs5kk3QaTCw@mail.gmail.com>
Date: Wed, 11 Mar 2015 14:20:18 -0700
Message-ID: <CAMKF1so+G38ckwYacvit1aA3CdgQk-mm-qiGfgi4ZrzA-g1FrQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 21:20:19 -0000
Content-Type: multipart/alternative; boundary=001a11409acc92a455051109d50b

--001a11409acc92a455051109d50b
Content-Type: text/plain; charset=UTF-8

On Mar 11, 2015 2:02 PM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 11 March 2015 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +               grep -q "tmpfs /var/volatile" /proc/mounts || mount -t
tmpfs -o strictatime tmpfs /var/volatile
>
>
> What is someone uses tmpfs[tab]/var/volatile?  This should match on
arbitrary whitespace.

Yes. But my commit does not make it worse than it already is.
>
> Ross

--001a11409acc92a455051109d50b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 11, 2015 2:02 PM, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 11 March 2015 at 18:07, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep -q &q=
uot;tmpfs /var/volatile&quot; /proc/mounts || mount -t tmpfs -o strictatime=
 tmpfs /var/volatile<br>
&gt;<br>
&gt;<br>
&gt; What is someone uses tmpfs[tab]/var/volatile?=C2=A0 This should match =
on arbitrary whitespace.</p>
<p dir=3D"ltr">Yes. But my commit does not make it worse than it already is=
.<br>
&gt;<br>
&gt; Ross</p>

--001a11409acc92a455051109d50b--
