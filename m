Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A44BE60DF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 08:10:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7D8Ai5U019206
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 01:10:44 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 01:10:43 -0700
Message-ID: <53EB1D82.4070009@windriver.com>
Date: Wed, 13 Aug 2014 16:10:42 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1407766043.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1407766043.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1 V2] insane.bbclass: add QA check: file-rdeps
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
X-List-Received-Date: Wed, 13 Aug 2014 08:10:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Talked with RP, we need check all the deps on the dependencies
chain, I will update it sooner.

// Robert

On 08/11/2014 10:09 PM, Robert Yang wrote:
> * Changes of V2:
>    Refer build-deps to check all the files' rdepends rather than only
>    check bash, perl and python as RP suggested.
>
> Next:
> * Fix the issues one by one:
>    - Remove the depends is possible (such as bash)
>    - Split the packages for perl and python depends when needed.
>
> // Robert
>
> The following changes since commit 63cbed337241191f33fe951662a39ce59dce6774:
>
>    oeqa/runtime: add new cpp test and file (2014-08-11 12:30:16 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/file-rdeps
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/file-rdeps
>
> Robert Yang (1):
>    insane.bbclass: add QA check: file-rdeps
>
>   meta/classes/insane.bbclass |   37 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
>

