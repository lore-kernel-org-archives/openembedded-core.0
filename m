Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D65C578248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:46:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7NCk7LP022328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 13:46:08 +0100
Message-ID: <1503492367.32591.153.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Amlie <kristian.amlie@northern.tech>,
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 13:46:07 +0100
In-Reply-To: <1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
References: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 13:46:08 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 12:46:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-23 at 14:39 +0200, Kristian Amlie wrote:
> I don't understand why I'm getting patch failures. This is rebased to
> cutting edge master. Trying one more time...

Its because you're patching documentation which is maintained in a
separate repository. Separating that from the patch will avoid that
error.

Cheers,

Richard

