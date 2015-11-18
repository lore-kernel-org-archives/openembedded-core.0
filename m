Return-Path: <akuster808@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6B56080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:26:30 +0000 (UTC)
Received: by ykba77 with SMTP id a77so39298019ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 17:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/o7w10X2KW76NvYnyXLyDOs3svP7u6VuIzDgoAj1ZAs=;
	b=yu5qQ1DUjTt7A8oRI2GtlDXoTVYvgOKMnhm+7WzNbfNTwwW3YNUZODXwx2UB0iJiv8
	ckEhvgpByeQp8nxEGw2e3U9g9Jpzrm3m2zSAXLFHUWksWs2uu5xFu6ED7MnFDn8MeUeD
	dLRmu32IUhPgUbA7I83MXH78p2K6iZhEakKnrClE4FUnmAKo4o0yDQYErzlqaeTp4+yc
	2gL8hGOJh0SuVM2ygdTB4S6hIvY30oIYfOCd3w+ERDRw1YNwBqZzA8wL+GD/eZ6CqQGJ
	yF1ne5/yIzY3D0YqiJI0NU6api3eaItredwAorzDkbn3+oOvL5gY9Lx3IykvDxPkS9Vy
	zwlw==
X-Received: by 10.129.87.67 with SMTP id l64mr955246ywb.55.1447809990693;
	Tue, 17 Nov 2015 17:26:30 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	q63sm431759ywf.16.2015.11.17.17.26.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 17:26:29 -0800 (PST)
To: wenzong.fan@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1447738630.git.wenzong.fan@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <564BD3C0.8000900@gmail.com>
Date: Tue, 17 Nov 2015 17:26:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1447738630.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/2] subversion: fix CVE-2015-3184, CVE-2015-3187
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
X-List-Received-Date: Wed, 18 Nov 2015 01:26:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 11/16/2015 09:38 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> The following changes since commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57:
> 
>   gcc: Drop 4.8 (2015-11-16 14:59:18 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib wenzong/svn
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/svn
> 
> Wenzong Fan (2):

Thanks.

>   subversion: fix CVE-2015-3184
>   subversion: fix CVE-2015-3187

These two fixes only affect Apache.

Apache version < 2.4.16 will need the following fix too.

CVE-2015-3185 httpd: ap_some_auth_required() does not properly indicate
authenticated request in 2.4


This affects fido.

- armin


> 
>  .../subversion-CVE-2015-3184.patch                 | 2094 ++++++++++++++++++++
>  .../subversion-CVE-2015-3187.patch                 |  346 ++++
>  .../subversion/subversion_1.8.13.bb                |    2 +
>  3 files changed, 2442 insertions(+)
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
> 

