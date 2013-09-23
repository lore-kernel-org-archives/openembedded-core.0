Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 423B9610FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 05:47:32 +0000 (UTC)
Received: from [192.168.101.5] (afplatform.bmw-carit.intra [192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id C6CAC4007F;
	Mon, 23 Sep 2013 06:44:11 +0200 (CEST)
Message-ID: <523FD5F5.1000209@oss.bmw-carit.de>
Date: Mon, 23 Sep 2013 07:47:33 +0200
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>, 
	openembedded-core@lists.openembedded.org
References: <1379307553-2744-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
In-Reply-To: <1379307553-2744-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: Re: [PATCH] boost: set up PACKAGECONFIG for boost-python library
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
X-List-Received-Date: Mon, 23 Sep 2013 05:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/16/2013 06:59 AM, Lukas Bulwahn wrote:
> Until now, the comment in the boost.inc file suggested to enable
> the boost-python library by uncommenting some lines in that file.
> Using the new PACKAGECONFIG feature, boost-python can now be added
> optionally without need to modify the file or copying those lines
> into a bbappend file.
> Furthermore, we obtain the python version by inheriting python-dir
> instead of fixing the python version in this file.
>
> This commit is motivated by the need in the meta-ros layer, as
> discussed in the issue #145 of the meta-ros issue tracker [1].
>
> [1] https://github.com/bmwcarit/meta-ros/pull/145
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
>   meta/recipes-support/boost/boost.inc |   15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> [...]
This patch has been pending since last Monday. Are there any general 
concerns about this patch or has it been simply overlooked?

Yours sincerely,

Lukas Bulwahn

