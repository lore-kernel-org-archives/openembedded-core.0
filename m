Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31C7078415
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 09:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A1261182C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id diNUsDDzd_HR
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:04 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 204A2180E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:04 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0280E1E081
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:04 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAFF31E080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:03 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:03 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id DE88F26D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:34:03 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id C87739C0AD; Mon,  4 Dec 2017 10:34:03 +0100 (CET)
Date: Mon, 4 Dec 2017 10:34:03 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171204093403.fc5ench24fpcu6ke@axis.com>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-2-olofjn@axis.com>
MIME-Version: 1.0
In-Reply-To: <20171201155024.3002-2-olofjn@axis.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/5] lib/oe/package.py: Expose is_elf
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
X-List-Received-Date: Mon, 04 Dec 2017 09:34:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-12-01 16:50 +0100, Olof Johansson wrote:
> is_elf/isELF had copies in both staging.bbclass and package.bbclass.
> After recent refactoring in staging.bbclass (involving breaking out the
> isELF function to is_elf in lib/oe/package.py), the implementions
> diverged. It would be beneficial to make everybody use this one
> implementation, so let's expose it here for others to use.
...
> +def is_elf(path, on_error=_is_elf_error):
...
> +    :param on_error: callable, gets called when an error occurs.
> +                     the callback takes a message parameter. A
> +                     default error handler is provided that prints
> +                     the message with 'bb.error'.
> +
...
> +    """
...
> +    if ret:
> +        error_cb('"file %s" failed')

This should be on_error, not error_cb, sorry! Will fix in v2,
together with not assuming "," in file output, as suggested by
Mark.

-- 
olofjn

