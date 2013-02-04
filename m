Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1U2NxW-0005Sc-F4
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 16:27:52 +0100
Received: by mail-bk0-f45.google.com with SMTP id i18so2806433bkv.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=0Rz7paJSqCaZ2S8UtSdFZav3WcBJgPEwMfbXOfS6vDs=;
	b=stSkAfBM0qcEbTo01HAl7sbBZVI5iHl2kM6IWNLogEa0bjI+6J1o0JFp9FOoDt6+1O
	pS1hLJpwIR/DDBBBESBKZckyRtDFYhOeumLS+8z9ZOF3vE9JTJNEPQcC+9qvsrl/HlOx
	DqbSUfQApTvE3jQgajHl7/BkZsrePQr4iP4aUSUU8+vjEIgESSyAHfleKm7Ma2jyfSTq
	VoXD4EVJubcK1qyii26dgqJ9gcWmvMApkCsEcLULSOYOKHB23TPxlLRJ69yJcj6tRIap
	g33pJ7HsIGwnSlCDFqC3P9rawLt4ocashlVNfzgcqk3EKG/qAWHvGjIrsVxERhVWUD9o
	n/5A==
X-Received: by 10.204.147.143 with SMTP id l15mr5741180bkv.28.1359990721641;
	Mon, 04 Feb 2013 07:12:01 -0800 (PST)
Received: from [172.16.140.31] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id g28sm5439764bkv.17.2013.02.04.07.11.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 07:12:00 -0800 (PST)
Message-ID: <510FCFAC.4050909@gmail.com>
Date: Mon, 04 Feb 2013 16:11:40 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1359706204.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359706204.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/69] master-next & MUT (post M3)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 15:28:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/01/2013 09:19 AM, Saul Wold wrote:
> Richard,
>
> Here is a group of M4 patches and updates that have been
> pending. I fixed a small issue I found with the package.bbclass
> changes in gkt-icon-cache.bbclass
>
> I have included the DEB Incremental image set along with
> the READ-Only Rootfs changes, this way they can get broader
> views and usage by the community.
>
> I have also include the GCC Multilib changes.
>
> I just started the AB on MUT without some failing patches
> (netbase and flex).
>
> Please watch it's status, There was a failure in the x86 GRUB
> build which may also point back to Flex.
>
> Sau!
>
> This include
> The following changes since commit 1489a69cecb1dcc3502a4c24beaea81e6ca6dacc:
>
>    harfbuzz: fix install of version.h (2013-01-31 12:29:18 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
>
> David Nyström (1):
>    Lets face it, adding python dependencies is really a painful manual
>      process, due to setuptools/distutils, ignoring anything other than
>      python dependencies.


Please drop above as well, it was an RFC meant to stir up some 
discussion, not meant for inclusion.




