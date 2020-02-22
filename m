Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8E29D6172D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 21:12:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Q1Hr4jhJz3l;
	Sat, 22 Feb 2020 22:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582405960;
	bh=OFfewpb8PRwDXshPlQrn5JbCzGjG/0dlpbqlpiNSTZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7rSa6Uh4pYe5okclHCaLVIV++a+ECzGYXyigw2mf+UeEHyuTsbF8fCLQ1io67Tj4
	ayEIS19tPG69/hhGWfu6BwNl0DF/hTp/KeS/4XYtZWGqPUuZOOlUV3uqyST33ezFIA
	n78uSchNWR1Wz/M3kIGd2fPUq1mj91900GSVrwaKbdxOuQUSuvDoz5iHRX1iLd/42Q
	JuLBOwU5sBK2PA35e2i7VVKq5Kiaig7+OeM6yzu+Xc3hdE+bBUOc/AAYbOL8F4/hox
	09aKcpCOUlCsZ2aSEqhXqjwSUzzDr5GFopY4Rp5nT4P51SRFn44JRPzHIhV9hok0ep
	wCEMe4O8wuwChqIygUrCi0lHP4IwCHN+wQEtXNwnWfgdd0UUWKji8dTSJYpducdzpX
	ktpuUdemdHd+DLafRTu3SY9W3pmM/h9ZnlPAcPc/5V6xjUi6N1J/Yxu+7jXNDO/TmM
	uorAwciS0gQ0hnbqY5f56SFdZKmxS6g757h1k8pAOyvbU3fif8+nCMMBfpoWxwQL8m
	6mnz0ayUrVKfvUahH1YbTRmt+O9SCbq8ZAJPPR5FmGfc9FBy1RTG/SAJxhYU1gO5U0
	+aFOjIhjiwsH/oI1mKjZ88kkxkzSA3m2isgBI+Hpupp9ptDTsAhYk2ZkSd1tB9p2Su
	7FayurwCYuwQb8EBILAA2rPI=
Date: Sat, 22 Feb 2020 23:12:34 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200222211234.GB9628@localhost>
References: <20200221210032.3414-1-bunk@stusta.de>
	<3a180667-45cb-a15a-8f6b-20d49802ee71@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3a180667-45cb-a15a-8f6b-20d49802ee71@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus][PATCH 1/2] libxml2: fix CVE-2020-7595
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
X-List-Received-Date: Sat, 22 Feb 2020 21:12:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Feb 22, 2020 at 10:50:13AM -0800, akuster808 wrote:
> On 2/21/20 1:00 PM, Adrian Bunk wrote:
> > From: Anuj Mittal <anuj.mittal@intel.com>
> >
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> Is this a backport from Master?

Yes.

> please include masters commit id.

openembedded-core commit id or poky commit id?
They are always different, and I am working on top of poky.

> Since Master and Zeus are at different versions, was there anything you
> had to do to make this apply to Zeus?

There is always the trivial change to the bb file.

> I have adopted the kernel stable note of [Fixup for XXX context] so the
> folks know things had to be tweaked from the original commit.

I am already doing the same for non-trivial changes, e.g.
http://lists.openembedded.org/pipermail/openembedded-core/2020-February/293312.html

> - Armin

cu
Adrian

