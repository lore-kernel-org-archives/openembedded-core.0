Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id DD6006E660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:06:32 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id d205so57216018oia.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=NKlBDW8dIKNlyhRDOQNz/ZXfZOd9zRAAJA61x/oPaR8=;
	b=Rjva0jPH8/crvu+wlrjmwaKu4fSsAOb7T2Hl/bk42YbOJe8O6womcgfdXWLZKQX98B
	N1Qu2ZGKjf/7/b8wznFZ2PJz9sFoN27c3PEUL5VnTQMzEv5xcFq2tM4UXp+RjyfO1Si+
	r/ufItgYXdq0N67TiLSCbkZdJom144fmfM41HuyEASm9XSeWg9Q5tuGSyrsmUeGAZoFP
	821XvoBqn4wlr7bwjozvuj5+qMHJsJWquw5+7sVGeS0JNKd1q3aVegEO5XQboO1O5fnf
	y/G1i/zo25/M040gpG8lEIzsbeBWEekfm1urr9Xa+TVcDDglYb11r9E/4o5mJweXTZye
	SVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=NKlBDW8dIKNlyhRDOQNz/ZXfZOd9zRAAJA61x/oPaR8=;
	b=JxxEt/AFmNEQjhfUU3eBsC8659ZyO34D6XdexTHoUkWdf36tE9hqLaqrNSkITL1PeN
	kHVTvXIFNYaw3Q+UeDc7wvE/okq6fy4eBtBA/l9rbCMOMfiE0VaOd9tRBB4KbpGrUyZD
	uOvveW3CwK3QjguvQ8OFkj//xsA1cnyd0muubQN6EYxWp2x2fAkfG9G3z4R4nL9OeKy5
	VxRPkZVM15Uy9AKsiecxCPSkyQxiZ58UiRj8QjIwB4UhXNK5eKMOqdiyPitQSDK3qKtP
	J1wKx1B8f9OWGxVduj6Gwi0DWc8g5g2B/ZAeiYXJoprs6Fmcj9oiDqBH9qJAH+AtauHl
	sAjw==
X-Gm-Message-State: AD7BkJLa16nfmznWPMC7aKtS95ZqpMD3ilAvDo3boz5tE8fvPiSInuY9s/7eniyWwLz6tFVLPV5pzCi5SerIKg==
MIME-Version: 1.0
X-Received: by 10.157.37.52 with SMTP id k49mr977447otb.119.1459425993079;
	Thu, 31 Mar 2016 05:06:33 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Thu, 31 Mar 2016 05:06:33 -0700 (PDT)
In-Reply-To: <56FCFC74.4080001@windriver.com>
References: <56FCF6E3.7090109@windriver.com> <56FCFC74.4080001@windriver.com>
Date: Thu, 31 Mar 2016 08:06:33 -0400
Message-ID: <CADkTA4Nw_y5QLzW14i-dzV2NRdnDV+jGeZv4ocF_zBKx7xmfbA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: aufs missing in kernel 4.4
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
X-List-Received-Date: Thu, 31 Mar 2016 12:06:34 -0000
Content-Type: multipart/alternative; boundary=001a113f061ce4c1fd052f5717de

--001a113f061ce4c1fd052f5717de
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 31, 2016 at 6:31 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> On 03/31/2016 06:07 PM, Hongxu Jia wrote:
>
>> Hi Bruce,
>>
>> In kernel 4.1, it supports aufs:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.1/tree/fs/aufs?h=standard/base
>>
>> But it does not exist in kernel 4.4:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.4/tree/fs?h=standard/base
>>
>> It caused ISO's rootfs is readonly.
>>
>> In meta/recipes-core/initrdscripts/files/init-live.sh:
>> -----------------
>> 174     elif grep -q -w "aufs" /proc/filesystems; then
>> 175         union_fs_type="aufs"
>> [snip]
>> 204         "aufs")
>> 205             mkdir -p /rootfs.ro /rootfs.rw
>> 206             if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
>> 207                 rm -rf /rootfs.ro /rootfs.rw
>> 208                 fatal "Could not move rootfs mount point"
>> 209             else
>> 210                 mount -t tmpfs -o rw,noatime,mode=755 tmpfs /
>> rootfs.rw
>> 211                 mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro"
>> aufs $ROOT_MOUNT
>> 212                 mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
>> 213                 mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
>> 214                 mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
>> 215             fi
>> 216             ;;
>> -----------------
>>
>> Would you please update kernel 4.4 to support aufs?
>>
>
> Or with Robert's patch in mailing list also could fix this issue.
>
> [OE-core] [PATCH 1/1] linux-yocto 4.4: enable overlayfs


If you read that very same thread ... aufs is already planned and queued.
There were
issues upstream that have now been sorted out.

Cheers,

Bruce


>
>
> //Hongxu
>
>
>
>> //Hongxu
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113f061ce4c1fd052f5717de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 31, 2016 at 6:31 AM, Hongxu Jia <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">On 03/31/2016 06:07 PM, Hongxu Jia wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Bruce,<br>
<br>
In kernel 4.1, it supports aufs:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.1/tree/f=
s/aufs?h=3Dstandard/base" rel=3D"noreferrer" target=3D"_blank">http://git.y=
octoproject.org/cgit/cgit.cgi/linux-yocto-4.1/tree/fs/aufs?h=3Dstandard/bas=
e</a> <br>
<br>
But it does not exist in kernel 4.4:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.4/tree/f=
s?h=3Dstandard/base" rel=3D"noreferrer" target=3D"_blank">http://git.yoctop=
roject.org/cgit/cgit.cgi/linux-yocto-4.4/tree/fs?h=3Dstandard/base</a> <br>
<br>
It caused ISO&#39;s rootfs is readonly.<br>
<br>
In meta/recipes-core/initrdscripts/files/init-live.sh:<br>
-----------------<br>
174=C2=A0 =C2=A0 =C2=A0elif grep -q -w &quot;aufs&quot; /proc/filesystems; =
then<br>
175=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0union_fs_type=3D&quot;aufs&quot;<br>
[snip]<br>
204=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;aufs&quot;)<br>
205=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p /<a href=3D"htt=
p://rootfs.ro" rel=3D"noreferrer" target=3D"_blank">rootfs.ro</a> /<a href=
=3D"http://rootfs.rw" rel=3D"noreferrer" target=3D"_blank">rootfs.rw</a><br=
>
206=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! mount -n --move $RO=
OT_MOUNT /<a href=3D"http://rootfs.ro" rel=3D"noreferrer" target=3D"_blank"=
>rootfs.ro</a>; then<br>
207=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf /<a=
 href=3D"http://rootfs.ro" rel=3D"noreferrer" target=3D"_blank">rootfs.ro</=
a> /<a href=3D"http://rootfs.rw" rel=3D"noreferrer" target=3D"_blank">rootf=
s.rw</a><br>
208=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fatal &quo=
t;Could not move rootfs mount point&quot;<br>
209=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
210=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount -t t=
mpfs -o rw,noatime,mode=3D755 tmpfs /<a href=3D"http://rootfs.rw" rel=3D"no=
referrer" target=3D"_blank">rootfs.rw</a><br>
211=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount -t a=
ufs -o &quot;dirs=3D/<a href=3D"http://rootfs.rw" rel=3D"noreferrer" target=
=3D"_blank">rootfs.rw</a>=3Drw:/<a href=3D"http://rootfs.ro" rel=3D"norefer=
rer" target=3D"_blank">rootfs.ro</a>=3Dro&quot; aufs $ROOT_MOUNT<br>
212=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $=
ROOT_MOUNT/<a href=3D"http://rootfs.ro" rel=3D"noreferrer" target=3D"_blank=
">rootfs.ro</a> $ROOT_MOUNT/<a href=3D"http://rootfs.rw" rel=3D"noreferrer"=
 target=3D"_blank">rootfs.rw</a><br>
213=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount --mo=
ve /<a href=3D"http://rootfs.ro" rel=3D"noreferrer" target=3D"_blank">rootf=
s.ro</a> $ROOT_MOUNT/<a href=3D"http://rootfs.ro" rel=3D"noreferrer" target=
=3D"_blank">rootfs.ro</a><br>
214=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount --mo=
ve /<a href=3D"http://rootfs.rw" rel=3D"noreferrer" target=3D"_blank">rootf=
s.rw</a> $ROOT_MOUNT/<a href=3D"http://rootfs.rw" rel=3D"noreferrer" target=
=3D"_blank">rootfs.rw</a><br>
215=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
216=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-----------------<br>
<br>
Would you please update kernel 4.4 to support aufs?<br>
</blockquote>
<br></div></div>
Or with Robert&#39;s patch in mailing list also could fix this issue.<br>
<br>
[OE-core] [PATCH 1/1] linux-yocto 4.4: enable overlayfs</blockquote><div><b=
r></div><div>If you read that very same thread ... aufs is already planned =
and queued. There were</div><div>issues upstream that have now been sorted =
out.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"HOEnZb"><font=
 color=3D"#888888"><br>
<br>
//Hongxu</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
//Hongxu<br>
<br>
</blockquote>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113f061ce4c1fd052f5717de--
