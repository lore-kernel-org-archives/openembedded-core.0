Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0DE7197A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:28:01 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 128so546660pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 15:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=c8QthXCLL+AAEWTMd/z2BXetWxjYwNy1RkkTkIozHzM=;
	b=pj0xk+1bapVSN/GDnl0C4F6F7ZjhFzGgjxEl7SBjCw16wrwLSmx1y5/86o/u4OC6tL
	8sSoNKJBShS/so96/0j+8XiJa/NgWAaVokyN62RcX6Jp73Ajj/1d6tMFPQstLkfdZCi5
	IIsJWRqKPf/eZv7eFhqoEL8mtk63qSmqQvyTGOxD+XmRaLkrhyZOXAg8x9SGWaB3B9ez
	8+aJ4bRPSKrt7vHdPIaLJzxydUsBl17QkEMQuVxbLXjXTALk5dAO6qGpE6c7b3Uh5Dcf
	4UfSrNowbPeq6AjAvxtEnou6YHSl+amq2qJE6yBDp49QzP6XsVrFRsPyi3+go39B/pmu
	4Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=c8QthXCLL+AAEWTMd/z2BXetWxjYwNy1RkkTkIozHzM=;
	b=ap/AQlbsRlM976v1gYRs8HqgA97lH+j3z8w1RU3CM20HRLKDK4WwdSQ8pmdolhgs2Z
	ThjM65jMye1zx3RYz0V8N8lvfIs/idArLEJkpuae2T5Je+e6cHuSdF9RvmFc4XF7KBE5
	gVHV/CfksZjgywLKY6b1/w8aLWH1moD3LSJ02unujFJYuBa5VrDnj+KlUs3Xs37bQVaL
	yThuNmMCcg2XxVwNBTgVsL+wNs6n8OP7W4Br5uO7BI5YUF2Ivu7+0DLHlBq7rLZzXgb3
	Y9u+KFuInQX0zeMmhgm922e1EH8KxF4wDm3VdQOV99hSY3ZZiBbxJdafuQx7H0AHwurJ
	eM+w==
X-Gm-Message-State: AA6/9RnrSzooYfVKGzU3uHife5z8zw/VUa17F3k22wUugbRv+qe6nONMZIcSMm2kyVPFeg==
X-Received: by 10.98.184.25 with SMTP id p25mr4729532pfe.56.1476829682975;
	Tue, 18 Oct 2016 15:28:02 -0700 (PDT)
Received: from [10.22.11.1] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	fl4sm58398222pad.39.2016.10.18.15.28.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 15:28:02 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1476828813.git.paul.eggleton@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <97522420-7928-525a-3eb1-96fea0c6f791@gmail.com>
Date: Tue, 18 Oct 2016 15:28:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1476828813.git.paul.eggleton@linux.intel.com>
Subject: Re: [krogoth][PATCH 00/10] Backports from master (cover letter only)
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
X-List-Received-Date: Tue, 18 Oct 2016 22:28:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/18/2016 03:15 PM, Paul Eggleton wrote:
> These have passed through the devtool/recipetool/bblayers oe-selftest
> tests.
>
>
> The following changes since commit a8f44dff13481feaa97e494a3aeafb5b63d40f3f:
>
>    binutils: fix AR issue when opkg is unpacking IPKs containing empty entries (2016-10-06 14:09:32 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/krogoth-fixes-oe
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/krogoth-fixes-oe

In my staging.

Thanks,
Armin
>
> Ola x Nilsson (2):
>    devtool: build_image: Fix recipe filter
>    devtool: Use the wildcard flag in update_recipe_patch
>
> Paul Eggleton (8):
>    devtool: update-recipe: fix --initial-rev option
>    devtool: reset: allow reset to work if the recipe file has been deleted
>    recipetool: create: fix handling of github URLs
>    lib/oe/recipeutils: fix patch_recipe*() with empty input
>    recipetool: create: fix greedy regex that broke support for github tarballs
>    oe-selftest: recipetool: add tests for git URL mangling
>    devtool: add: fix error message when only specifying a recipe name
>    classes/externalsrc: re-run do_configure when configure files change
>
>   meta/classes/autotools.bbclass       |  2 ++
>   meta/classes/cmake.bbclass           |  2 ++
>   meta/classes/externalsrc.bbclass     | 22 ++++++++++++++++++
>   meta/lib/oe/recipeutils.py           |  2 +-
>   meta/lib/oeqa/selftest/recipetool.py | 43 ++++++++++++++++++++++++++++++++++++
>   scripts/lib/devtool/build_image.py   |  2 +-
>   scripts/lib/devtool/standard.py      | 18 +++++++--------
>   scripts/lib/recipetool/create.py     |  2 +-
>   8 files changed, 80 insertions(+), 13 deletions(-)
>


