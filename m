Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBD1E708AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 20:55:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6SKtRwo009226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:55:27 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 13:55:27 -0700
Date: Mon, 28 Jul 2014 15:55:01 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140728155501.7165f1e4@e6410-2>
In-Reply-To: <53D69D88.8090009@windriver.com>
References: <cover.1406572002.git.peter.seebach@windriver.com>
	<c49369320ca271d42175888f5b9daccf45c297bf.1406572002.git.peter.seebach@windriver.com>
	<CAMKF1so=YuEoE2vQgG_yZWLzeKg=71vYEdHnX0V8fNowL=95zg@mail.gmail.com>
	<53D69D88.8090009@windriver.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Add support for ld.so.conf.d
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
X-List-Received-Date: Mon, 28 Jul 2014 20:55:33 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 28 Jul 2014 13:59:20 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> In a read-only root case, the ld.so.cache is generated in the cross environment. 
>   I don't know if the cross ldconfig knows about the includes though.  Someone 
> will have to check that.

It appears to be the same source, so it has the functionality at least in the
code.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

