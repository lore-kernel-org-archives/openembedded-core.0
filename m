Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 93FF871B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 14:04:33 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 25so16890007ioj.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GU/6rhnhp/vxJuInOkxgdMA6Utlf7Sn9otylNWEt2ek=;
	b=QP4+QWgBFaRV2v/EdXd9IC+Mqkr3PEW0oar3G/p+JkqulL2qtMI3VKdpnXVZCk8jJg
	R5LW1QlLD9pZ/VcsHNhxdiJC6R1KiAyVBZUs2LxJGsn1Dhah3BdS6lmigjA/nm38oBOU
	LRHcoI+OEsx5RFrsl6OZynzukO33CYH1nXp6IKRmN8JN9TNWDZbzXjj5UGdVGB9hbOOc
	qmv6eozX55IyvdMDc5rEjpdYFEZAheMjQbK/HKB85DQPohUUPtvvA9ccayQn0oc6eNa6
	3jorJVDlDH4KcBDhaDEsspqUjFaFSGvLXNRzXUjb/tRt7QqaJs/+dJH+dQznEI0QWbHz
	z8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GU/6rhnhp/vxJuInOkxgdMA6Utlf7Sn9otylNWEt2ek=;
	b=VLITksf7L1vyyQUxAZaqDe1PvXELhzR6gZ4JWZKkKJG5dXEGkQXjNmfslOUz0LqCEJ
	q9uZ6naaucCp6LTTqfnvBNTO6uSYawEZxd039t3yJXBINn8kLBfKPTIr16yT0OcC5+VV
	LaR1H9AOFHxWbwyZE1z9Z1YF7jIh9BWp/srwXhTQj5dtAv6JeVXg2dl2y/uR24UhM7DT
	h3ADmMUY8Nlalqhgm53e9v392gTZXjgYq3M0pNAhd8n7kQNef10OJxWGCexrelJhni4S
	HCESVpGHqbX4Ns1UPQMqoPJqP4Ca94hBa2GBBPzqFx/pb98SR8SLA456B334JBkq1u3e
	hyaQ==
X-Gm-Message-State: AKwxytdCTcqHynQcnm0X+AoY71tdFdskTKBUOC//wYnyu8WVFOOFJhwb
	twr4qByT2pQHH1ZtsVX6E24QukgK7n4T49rP9ydTpQ==
X-Google-Smtp-Source: ACJfBou4Ct3nnePKTPT9wKvmZhv35o9tKDoMWkR5NbzsSTsP4+eoPlr972vazPpYYsjco7NAJRcMXY68Yeaqn1g9s2g=
X-Received: by 10.107.175.8 with SMTP id y8mr9778691ioe.37.1516111474673; Tue,
	16 Jan 2018 06:04:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Tue, 16 Jan 2018 06:04:14 -0800 (PST)
In-Reply-To: <CAJTo0LbHs0aVrvQi2RwSK=2FAe6q5nyYsu9CxDcnKrBae=f70Q@mail.gmail.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
	<CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
	<20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
	<CAJTo0LYFZqkc_KMXKjNmX4M3z0UjAjGpRLNingKsmXf7yBUmHQ@mail.gmail.com>
	<CAJTo0LbHs0aVrvQi2RwSK=2FAe6q5nyYsu9CxDcnKrBae=f70Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jan 2018 14:04:14 +0000
Message-ID: <CAJTo0LZC6AJhTs0PtbRvfHK-dqjgfZvNSdN3gXGdWksaBZOP6Q@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Tue, 16 Jan 2018 14:04:33 -0000
Content-Type: multipart/alternative; boundary="001a1144a268e367b00562e53530"

--001a1144a268e367b00562e53530
Content-Type: text/plain; charset="UTF-8"

Another fix would be to respect USE_NLS and seed msgfmt=/bin/false
appropriately.  I'll test that later, or you can get the glory if you can
send a tested patch.

Ross

On 16 January 2018 at 13:58, Burton, Ross <ross.burton@intel.com> wrote:

> I've got a local patch that does this in the glib recipe:
>
> USE_NLS_class-target = "yes"
> USE_NLS_class-nativesdk = "yes"
>
> Can you verify this fixes the problem for you?
>
> Ross
>
> On 16 January 2018 at 13:56, Burton, Ross <ross.burton@intel.com> wrote:
>
>> GLib doesn't really support disable-nls, no.  I guess we need to force it
>> on for target builds, as I now hack it to work without gettext for native.
>>
>> Ross
>>
>> On 16 January 2018 at 11:55, Mike Crowe <mac@mcrowe.com> wrote:
>>
>>> On 15 January 2018 at 17:53, Mike Crowe <mac@mcrowe.com> wrote:
>>> >> If I add USE_NLS = "no" to local.conf, then glib-2.0 fails to
>>> configure:
>>> >>
>>> >> | checking for ngettext in libc... yes
>>> >> | checking for dgettext in libc... yes
>>> >> | checking for bind_textdomain_codeset... (cached) yes
>>> >> | checking for msgfmt... no
>>> >> | configure: error:
>>> >> | *** You must have either have gettext support in your C library, or
>>> use
>>> >> | the
>>> >> | *** GNU gettext library.
>>> >> | (http://www.gnu.org/software/gettext/gettext.html)
>>> >>
>>> >> It seems that glib-2.0 does not support --disable-nls and always
>>> requires
>>> >> gettext.
>>> >>
>>> >> I can avoid this error by adding gettext-native to glib-2.0's
>>> DEPENDS, but
>>> >> I'm not sure whether this is solution would be acceptable.
>>> >>
>>> >> Is there a better way?
>>>
>>> On Monday 15 January 2018 at 19:34:35 +0000, Burton, Ross wrote:
>>> > Have a look at what just landed in master...
>>>
>>> Perhaps I'm being stupid, but it looks like nothing has landed on master
>>> since Sunday.
>>>
>>> Looking at the history, I see 1ef45d377519983df827650cd0913e0d2c8a785b ,
>>> but I already had that change. Reverting it does appear to fix the
>>> problem
>>> though. Is that what you meant? If not, please can you point me at the
>>> commit you are referring to?
>>>
>>> Thanks.
>>>
>>> Mike.
>>>
>>
>>
>

--001a1144a268e367b00562e53530
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another fix would be to respect USE_NLS and seed msgfmt=3D=
/bin/false appropriately.=C2=A0 I&#39;ll test that later, or you can get th=
e glory if you can send a tested patch.<div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 16 January 201=
8 at 13:58, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burto=
n@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;ve got a local pat=
ch that does this in the glib recipe:<div><br></div><div><div>USE_NLS_class=
-target =3D &quot;yes&quot;</div><div>USE_NLS_class-nativesdk =3D &quot;yes=
&quot;</div></div><div><br></div><div>Can you verify this fixes the problem=
 for you?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></di=
v><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div class=3D"h5=
"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 16 January 2=
018 at 13:56, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.bur=
ton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">GLib doesn&#39;t reall=
y support disable-nls, no.=C2=A0 I guess we need to force it on for target =
builds, as I now hack it to work without gettext for native.<span class=3D"=
m_-4115349128874631033HOEnZb"><font color=3D"#888888"><div><br></div><div>R=
oss</div></font></span></div><div class=3D"m_-4115349128874631033HOEnZb"><d=
iv class=3D"m_-4115349128874631033h5"><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On 16 January 2018 at 11:55, Mike Crowe <span dir=3D"l=
tr">&lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On 15 January=
 2018 at 17:53, Mike Crowe &lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"=
_blank">mac@mcrowe.com</a>&gt; wrote:<br>
&gt;&gt; If I add USE_NLS =3D &quot;no&quot; to local.conf, then glib-2.0 f=
ails to configure:<br>
&gt;&gt;<br>
&gt;&gt; | checking for ngettext in libc... yes<br>
&gt;&gt; | checking for dgettext in libc... yes<br>
&gt;&gt; | checking for bind_textdomain_codeset... (cached) yes<br>
&gt;&gt; | checking for msgfmt... no<br>
&gt;&gt; | configure: error:<br>
&gt;&gt; | *** You must have either have gettext support in your C library,=
 or use<br>
&gt;&gt; | the<br>
&gt;&gt; | *** GNU gettext library.<br>
&gt;&gt; | (<a href=3D"http://www.gnu.org/software/gettext/gettext.html" re=
l=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/g<wbr>ettext=
/gettext.html</a>)<br>
&gt;&gt;<br>
&gt;&gt; It seems that glib-2.0 does not support --disable-nls and always r=
equires<br>
&gt;&gt; gettext.<br>
&gt;&gt;<br>
&gt;&gt; I can avoid this error by adding gettext-native to glib-2.0&#39;s =
DEPENDS, but<br>
&gt;&gt; I&#39;m not sure whether this is solution would be acceptable.<br>
&gt;&gt;<br>
&gt;&gt; Is there a better way?<br>
<br>
</span><span>On Monday 15 January 2018 at 19:34:35 +0000, Burton, Ross wrot=
e:<br>
&gt; Have a look at what just landed in master...<br>
<br>
</span>Perhaps I&#39;m being stupid, but it looks like nothing has landed o=
n master<br>
since Sunday.<br>
<br>
Looking at the history, I see 1ef45d377519983df827650cd0913e<wbr>0d2c8a785b=
 ,<br>
but I already had that change. Reverting it does appear to fix the problem<=
br>
though. Is that what you meant? If not, please can you point me at the<br>
commit you are referring to?<br>
<br>
Thanks.<br>
<span class=3D"m_-4115349128874631033m_6609721706575190122HOEnZb"><font col=
or=3D"#888888"><br>
Mike.<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1144a268e367b00562e53530--
