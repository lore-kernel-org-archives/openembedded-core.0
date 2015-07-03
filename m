Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 71930757F4;
	Fri,  3 Jul 2015 06:16:55 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so101401593wid.1;
	Thu, 02 Jul 2015 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dq6f8Hnvpmew3gKd4Ix41pZSgEQNO5mZ9Q8mLA0iIqg=;
	b=AGIkbhbhj8VmfchnBYRVgyl5tCRpOxzZkA2FJI1FmS6epfCos4jQzwwwYoRQNhOlFT
	q0ew7QjR6YhB68qzWDonJ8Q7xCd85vu6NL3LGnF21b/sSol9g2Qi7WYLrs2zQocUshTj
	T13W2fyfKR2BXChBBHwrG8k4jBgn5mjPovw6ijl67CX8hAuUEoIUKcczvuBC6vNNJz2J
	E64wrOYd8YHVwURuFNwyJGy4tRVUi+DICmbLSGiJCU2PP7BpsjQEuWZ1tSI/7EdgBUYI
	4sG2Y7sh+90yA19qesHzUKh5Zzb1LDFT0eXycMe7Tg8q6hndjs81YE0ajdSDD50pOJ87
	xQtQ==
MIME-Version: 1.0
X-Received: by 10.194.2.161 with SMTP id 1mr63461844wjv.143.1435904215064;
	Thu, 02 Jul 2015 23:16:55 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Thu, 2 Jul 2015 23:16:54 -0700 (PDT)
In-Reply-To: <5595F075.5010309@gmail.com>
References: <558B6EE7.5090107@gmail.com> <20150625105906.GA2394@jama>
	<5595F075.5010309@gmail.com>
Date: Fri, 3 Jul 2015 08:16:54 +0200
Message-ID: <CA+chaQeCV9gvoGDAz5NQrzNaR1WJNkW1u4Bg_CLwzLCVrZMr0A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: google mercurial repo issues
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
X-List-Received-Date: Fri, 03 Jul 2015 06:17:02 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8410abc5800519f280ec

--047d7b3a8410abc5800519f280ec
Content-Type: text/plain; charset=UTF-8

No, the bitbake fix was merged yesterday:

http://git.openembedded.org/bitbake/commit/?id=378647281ae883dd726f1e1b775dd35ef6a0e8d1

On Fri, Jul 3, 2015 at 4:16 AM, akuster808 <akuster808@gmail.com> wrote:

> It seems to be working today. wonder if it is do to mercurial-native
> update?
>
> - armin
>
>
> On 06/25/2015 03:59 AM, Martin Jansa wrote:
>
>> On Wed, Jun 24, 2015 at 08:00:55PM -0700, akuster808 wrote:
>>
>>> Hello all,
>>>
>>> I have run into an issue trying to build vim.
>>>
>>
>> That's broken for a while (see world reports), because bitbake mercurial
>> fetcher is broken.
>>
>>  /usr/bin/env hg pull
>>> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim
>>> | DEBUG: Python function base_do_unpack finished
>>> | DEBUG: Python function do_unpack finished
>>> | ERROR: Function failed: Fetcher failure: Fetch command failed with
>>> exit code 255, output:
>>> | abort: repository
>>> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim not found!
>>>
>>>
>>> there is a note on google regarding their hg repos: "We have some known
>>> issues with hg repositories."
>>>
>>> https://groups.google.com/forum/#!topic/google-code-hosting/Gh3kl9MrzY4
>>>
>>>
>>> is anyone else seeing this?
>>>
>>> - armin
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>

--047d7b3a8410abc5800519f280ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, the bitbake fix was merged yesterday:<div><br></div><d=
iv><a href=3D"http://git.openembedded.org/bitbake/commit/?id=3D378647281ae8=
83dd726f1e1b775dd35ef6a0e8d1">http://git.openembedded.org/bitbake/commit/?i=
d=3D378647281ae883dd726f1e1b775dd35ef6a0e8d1</a><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jul 3, 2015 at 4:16=
 AM, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">It seems to be working today. wonder if it is do to =
mercurial-native update?<br>
<br>
- armin<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 06/25/2015 03:59 AM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Jun 24, 2015 at 08:00:55PM -0700, akuster808 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello all,<br>
<br>
I have run into an issue trying to build vim.<br>
</blockquote>
<br>
That&#39;s broken for a while (see world reports), because bitbake mercuria=
l<br>
fetcher is broken.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
/usr/bin/env hg pull<br>
/home/akuster/oss/downloads/hg/<a href=3D"http://vim.googlecode.com/hg/vim"=
 rel=3D"noreferrer" target=3D"_blank">vim.googlecode.com/hg/vim</a><br>
| DEBUG: Python function base_do_unpack finished<br>
| DEBUG: Python function do_unpack finished<br>
| ERROR: Function failed: Fetcher failure: Fetch command failed with<br>
exit code 255, output:<br>
| abort: repository<br>
/home/akuster/oss/downloads/hg/<a href=3D"http://vim.googlecode.com/hg/vim"=
 rel=3D"noreferrer" target=3D"_blank">vim.googlecode.com/hg/vim</a> not fou=
nd!<br>
<br>
<br>
there is a note on google regarding their hg repos: &quot;We have some know=
n<br>
issues with hg repositories.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
<a href=3D"https://groups.google.com/forum/#!topic/google-code-hosting/Gh3k=
l9MrzY4" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/for=
um/#!topic/google-code-hosting/Gh3kl9MrzY4</a><br>
<br>
<br>
is anyone else seeing this?<br>
<br>
- armin<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--047d7b3a8410abc5800519f280ec--
