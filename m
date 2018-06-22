Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 323AD75259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 07:42:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5M7g5JC032063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 22 Jun 2018 08:42:06 +0100
Message-ID: <83bb6e51f031775c329e8d23f1d97151753e1f7d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 08:42:05 +0100
In-Reply-To: <61dc8ffbd2c1268e13572d36916dbe3d54e51cce.1529603271.git.chris_larson@mentor.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
	<61dc8ffbd2c1268e13572d36916dbe3d54e51cce.1529603271.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/5] bbpath-intercepts.bbclass: add class
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
X-List-Received-Date: Fri, 22 Jun 2018 07:42:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-22 at 02:08 +0500, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This class sets POSTINST_INTERCEPTS and
> POSTINST_INTERCEPTS_CHECKSUMS,
> to allow us to pull intercepts from BBPATH. This is kept as a
> separate
> class, as it's needed by both image construction and sdk
> construction,
> the latter to support meta-toolchain & similar recipes.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/bbpath-intercepts.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/classes/bbpath-intercepts.bbclass

We're struggling a bit with classes and namespaces. I'm wondering if
this might be better as "image-postinst-intercepts.bbclass" or similar.
That would mean the variable namespace matches the class and that the
image classes are more 'together'.

Your next patch will need rebasing against the changes that just merged
into master in image.bbclass.

I have also wondered about pushing more code to lib/oe but I can see
why this makes sense as a bbclass.

Cheers,

Richard


