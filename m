Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Quo3S-0000kF-K6
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 18:05:50 +0200
Received: by iyf13 with SMTP id 13so7645802iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=dsFRaYPNhTK19KJ+33o1fZRKLtcmUYAS2HTGfYuZjsE=;
	b=O0RDIJk3C+GDazffsWVacEAMEtP0tS1Z8W1aX8VrtRiYOecUn73xnxTgh78iL59IZk
	bVIKCuZxiCbXY/ru6v9uCpCHqgFAOP6JUiG3aChhOfpJDAhauytdRy42KCzVHQudN8+N
	QArBcAUtJXAWeyMqRRGIpUiBLwb5S+jfQmgcM=
Received: by 10.42.244.133 with SMTP id lq5mr559267icb.405.1313856067881;
	Sat, 20 Aug 2011 09:01:07 -0700 (PDT)
Received: from [172.23.5.198] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id n14sm2248462ibi.22.2011.08.20.09.01.05
	(version=SSLv3 cipher=OTHER); Sat, 20 Aug 2011 09:01:06 -0700 (PDT)
Message-ID: <4E4FDA4D.9020508@gmail.com>
Date: Sat, 20 Aug 2011 09:01:17 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <91e2a59d20e1d1992691684fb2dd64a6405ec6e3.1313791350.git.dvhart@linux.intel.com>
	<fa0a22eee3461de38fc4b41a76f15980b78fd0bf.1313791350.git.dvhart@linux.intel.com>
In-Reply-To: <fa0a22eee3461de38fc4b41a76f15980b78fd0bf.1313791350.git.dvhart@linux.intel.com>
Subject: Re: [PATCH 2/3] tune: remove thumb flag from non-thumb cortexa8 tune variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Aug 2011 16:05:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/2011 3:06 PM, Darren Hart wrote:
> The thumb flag "t" appears to have been copy/pasted to all the
> PACKAGE_EXTRA_ARCHS tune variables. Remove it from the non-thumb versions.
>

hmmm non thumb versions can run thumb packages. So I think its ok to 
have t in EXTRA_ARCHS

> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> CC: Jason Kridner<jkridner@beagleboard.org>
> CC: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/conf/machine/include/tune-cortexa8.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index 02b560c..67c5f0b 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -10,7 +10,7 @@ TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
>   TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
>   TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
>
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
>   PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
>



