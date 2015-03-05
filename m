Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 01C1771637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3BEEC315143F;
	Thu,  5 Mar 2015 15:49:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id skmUfm0E1lF2; Thu,  5 Mar 2015 15:49:45 +0100 (CET)
Received: from [172.22.22.61] (55d44e54.access.ecotel.net [85.212.78.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6910D315143B;
	Thu,  5 Mar 2015 15:49:45 +0100 (CET)
Message-ID: <54F86D09.5060501@opendreambox.org>
Date: Thu, 05 Mar 2015 15:49:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>	
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>	
	<1425504462-6979-2-git-send-email-bruno.bottazzini@intel.com>	
	<54F83775.5040604@opendreambox.org>	
	<1425561390.2707.29.camel@bottazzini-ThinkPad-T430>	
	<54F863AC.1050204@opendreambox.org>
	<1425565747.2831.4.camel@bottazzini-ThinkPad-T430>
In-Reply-To: <1425565747.2831.4.camel@bottazzini-ThinkPad-T430>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus: split tools package.
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
X-List-Received-Date: Thu, 05 Mar 2015 14:49:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 05.03.2015 15:29, Bottazzini, Bruno wrote:
> I receive the following problem:
> ERROR: Nothing RPROVIDES 'dbus-native-tools-native' (but
> virtual:native:PATH/poky/meta/recipes-core/dbus/dbus_1.8.10.bb RDEPENDS
> on or otherwise requires it
> 
> Any suggestion of how to fix it?

Try setting RRECOMMENDS_${PN}_class-native = "".

I still wonder why "-native" appears twice inside this dependency, but I
fail to spot the cause inside the dbus recipe.

Regards,
Andreas

