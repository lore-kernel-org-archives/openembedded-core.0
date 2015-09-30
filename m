Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7CD76DE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:08:33 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so182169659wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wkmtTp6I56sG/Rmk9DvQ8GY1hokB1HHWf9mhE7zGAdw=;
	b=NFTm0wjhkSkF6e5Jycqt4EmaTMrSEDz4AGObgNBojoT283Y3Gpzv12306yL3VKgnpS
	7ZHtvUppQfFZ6kQ8//pVlijt2y2JNxVUtAPKdFm+y8oeHDk/6euFAX4QZ0jxWnuL/c7b
	8nJZCX2f3OAPBZGu/UbbUBwT4+SYDEWYCDR6zV2SUQvH+TYh+sx401PyI481ePunht96
	pR94VY0f4vKiWYHFpgIMi4hQo6/d+wFH8OjCBScXR812nqSImlYts99BVhe4iTWUILtF
	wN9CHxqP8G0ljParzzrGn7Q+QvA6rFkT1HDCJWIUjNik+Q3eZPRZRIqCKc8AW9/jtetf
	Jizg==
X-Gm-Message-State: ALoCoQldN7eQFSO/BkRVBGRE9N5xnD+1HJxfWvRkpHZJti5285Ya02lWoMPxxZ3VXeIAaNachJlI
X-Received: by 10.180.88.198 with SMTP id bi6mr31379125wib.75.1443596913907;
	Wed, 30 Sep 2015 00:08:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Wed, 30 Sep 2015 00:08:04 -0700 (PDT)
In-Reply-To: <CAJTo0LZKYa5h-Ziprps5XP2AEDzpdUNT5O85rdnK23Dd2zBUZw@mail.gmail.com>
References: <cover.1443179044.git.jussi.kukkonen@intel.com>
	<aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
	<56056F47.7040004@opendreambox.org>
	<CAJTo0LZKYa5h-Ziprps5XP2AEDzpdUNT5O85rdnK23Dd2zBUZw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 30 Sep 2015 10:08:04 +0300
Message-ID: <CAHiDW_F1GDB4j_jne6w2VdCbWUCaYsV_jZEg949GYyJR2gUKSQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] connman: Depend on xuser-account unconditionally
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
X-List-Received-Date: Wed, 30 Sep 2015 07:08:38 -0000
Content-Type: multipart/alternative; boundary=f46d0443040c40af660520f19919

--f46d0443040c40af660520f19919
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 19:12, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 September 2015 at 16:59, Andreas Oberritter <obi@opendreambox.org>
> wrote:
>
>> Whether to add user accounts or not should be a decision made by the
>> distro. If this setting is machine specific, which to be honest
>> surprised me, why don't you just let the machine specific xorg video
>> driver depend on xuser-account unconditionally? Connman really doesn't
>> need this account.
>>
>
> connman does need the account as it uses it to allow a non-root X user to
> actually use connman.  DBus should warn if you try and set policy that uses
> users that entirely don't exist.
>
> I wonder if dbus lets multiple files assign policy, so the dbus rules
> could go into the xuser package?
>

I see the patch is in master now but I'll just note here that Ross' idea
here seems like a good solution (even if it makes figuring out the overall
policy a little trickier for humans) and I see nothing that would prevent
it from working. I just got side tracked with other D-Bus policy bugs while
look at this: After I'm done with those I'll make a patch to move the xuser
connman policy to the xuser recipe.

Jussi

--f46d0443040c40af660520f19919
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
5 September 2015 at 19:12, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><span class=3D""><div class=3D"gmail_quote">On 25 September 2=
015 at 16:59, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=3D"mailto:ob=
i@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">Whet=
her to add user accounts or not should be a decision made by the<br>
distro. If this setting is machine specific, which to be honest<br>
surprised me, why don&#39;t you just let the machine specific xorg video<br=
>
driver depend on xuser-account unconditionally? Connman really doesn&#39;t<=
br>
need this account.</div></blockquote></div><br></span>connman does need the=
 account as it uses it to allow a non-root X user to actually use connman.=
=C2=A0 DBus should warn if you try and set policy that uses users that enti=
rely don&#39;t exist.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I wonder if dbus lets multiple files assign policy, so the=
 dbus rules could go into the xuser package?</div></div></blockquote><div><=
br></div><div>I see the patch is in master now but I&#39;ll just note here =
that Ross&#39; idea here seems like a good solution (even if it makes figur=
ing out the overall policy a little trickier for humans) and I see nothing =
that would prevent it from working. I just got side tracked with other D-Bu=
s policy bugs while look at this: After I&#39;m done with those I&#39;ll ma=
ke a patch to move the xuser connman policy to the xuser recipe.</div><div>=
<br></div><div>Jussi</div></div></div></div>

--f46d0443040c40af660520f19919--
