Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF8178248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:47:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7NClCwn022434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 13:47:14 +0100
Message-ID: <1503492432.32591.155.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Amlie <kristian.amlie@northern.tech>,
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 13:47:12 +0100
In-Reply-To: <1503491991-14792-2-git-send-email-kristian.amlie@northern.tech>
References: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-2-git-send-email-kristian.amlie@northern.tech>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 13:47:14 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v5] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 12:47:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-23 at 14:39 +0200, Kristian Amlie wrote:
> From: Kristian Amlie <kristian.amlie@mender.io>
> 
> This is a direct followup from the earlier f6a064d969f414 commit in
> wic. It works more or less the same way: The variable specifies a
> list
> of directories relative to the root of the rootfs, and these
> directories will be excluded from the resulting rootfs image. If an
> entry ends with a slash, only the contents are omitted, not the
> directory itself.
> 
> Since the intended use of the variable is to exclude certain
> directories from the rootfs, and then include said directories in
> other partitions, it is not natural for this variable to be respected
> for image creators that create multi partition images. Therefore the
> default is to ignore the variable, and image creators that create
> single root filesystems need to set
> 
>   do_image_myfs[respect_exclude_path] = "1"
> 
> in order to honor it. Specifically, "wic" and "multiubi" have not
> received this variable flag, while others have.

I have to wonder if this is implemented the correct way around. Would
it not be better to mark multiubi and wic as not wanting this feature,
rather than requiring every other image creation method (which may even
be in other layers) to set this?

Cheers,

Richard


