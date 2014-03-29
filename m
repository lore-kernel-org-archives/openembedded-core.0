Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1250160DFA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 10:58:30 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id ec20so4548616lab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version:content-type;
	bh=P7pt8dq7Lc1+uqENwAESPyRxhSaTsTyHKh9LMJqlVhM=;
	b=O3cX/BfKmTfEyXU8C5rXKZJGCNWPRD5u8PO/WYEIZlhk9qPHrcXC1Rtsce0U9FCMwD
	Bsyo5kI54fTNxuNOURHWEn/DqzW5NUC7Fj4Ui333T/4xTU1XnCoXkh19mYffV4UwPdV8
	Q1tOpnVLEHHJ/JjPd8aDJ5v2DxKsEsC9iPspXfCFCJ1VFwr10wngXfdWMzSRprTIvPy6
	31HhL4hNSxxzuLqPWpF+mtaC324Jw8kUcIPYl2nSbbhDWRsD9IrK4uR+qBYf4BPgprUx
	18ZHQpEm2arXIwjSghlbY31CjGUHXmw21f3Nx7IkTYybWtsd5ZK6wsaFGR16LnlJ1duO
	JpLA==
X-Received: by 10.152.120.195 with SMTP id le3mr9862513lab.6.1396090710270;
	Sat, 29 Mar 2014 03:58:30 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id cr6sm5603101lbb.19.2014.03.29.03.58.29
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Mar 2014 03:58:29 -0700 (PDT)
Date: Sat, 29 Mar 2014 11:57:59 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
Message-ID: <alpine.LFD.2.11.1403291157470.14820@localhost.localdomain>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] sstate-cache-management fixes
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
X-List-Received-Date: Sat, 29 Mar 2014 10:58:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Sat, 29 Mar 2014, Martin Jansa wrote:

> Removing do_package was reported by Jacob Kroon and then I've found
> few more issues, the most surprising is the one with populate_lic.
>
> The following changes since commit b16de9af5c7108396a347e7107c73608a2f8d74f:
>
>  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:07 +0000)
>
> are available in the git repository at:
>
>  git://git.openembedded.org/openembedded-core-contrib jansa/sstate-management
>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/sstate-management
>
> Martin Jansa (4):
>  sstate-cache-management: rm_by_stamps - include signatures of
>    .sigdata. files
>  sstate-cache-management: rm_by_stamps - remove .siginfo and .done
>    files
>  sstate-cache-management: skip populate_lic archives when removing
>    duplicates
>  sstate-cache-management: rm_by_stamps - discover all suffixes like
>    remove_duplicated does
>
> scripts/sstate-cache-management.sh | 34 ++++++++++++++++++++--------------
> 1 file changed, 20 insertions(+), 14 deletions(-)
>

For the whole patch series:

Tested-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>

