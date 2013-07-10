Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id CE59B60845
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:32:08 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-86-109.range86-137.btcentralplus.com
	[86.137.86.109]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 11BC39530
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 09:32:08 +0100 (BST)
Message-ID: <51DD1C08.5020905@r-finger.com>
Date: Wed, 10 Jul 2013 09:32:08 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130630 Icedove/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1373440331.git.Qi.Chen@windriver.com>
	<afc49ee69b585666f57d826e2e5f526335f62835.1373440331.git.Qi.Chen@windriver.com>
In-Reply-To: <afc49ee69b585666f57d826e2e5f526335f62835.1373440331.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] init-live.sh: allow users to choose the boot action
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
X-List-Received-Date: Wed, 10 Jul 2013 08:32:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/07/13 08:12, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Previously, the boot action for live images was totally determined
> by the LABEL value in the boot parameters (/proc/cmdline).
> 
> This behavior is not very convenient for users. The user may just want
> to drop to a shell for troubleshooting the live image, or the user may
> want to try to install the live image while the LABEL value is 'boot'.
> 
> We should provide the users a chance to choose the boot action when
> the live image starts up.

I am not entirely clear on why this is needed, the LABEL kernel cmdline
parameter is set up by syslinux, and its value can be specified by the
user from the syslinux prompt. If what you want is a more user friendly
menu, then I think the correct solution would be to tweak the syslinux
config, rather than to create a duplicate boot menu in the init script.

Tomas


-- 
http://sleepfive.com

