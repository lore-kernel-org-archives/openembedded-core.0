Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id E45DF600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 15:35:26 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 68796C4993;
	Thu, 29 Sep 2016 10:35:27 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "Robert Yang" <liezhi.yang@windriver.com>
Date: Thu, 29 Sep 2016 10:35:26 -0500
Message-ID: <3F4F8F39-EC89-4A8B-BCF9-167896459A2D@seebs.net>
In-Reply-To: <c44a3f3eb02ab9e6482a1dc6f97511b64d4139d8.1475128528.git.liezhi.yang@windriver.com>
References: <cover.1475128528.git.liezhi.yang@windriver.com>
	<c44a3f3eb02ab9e6482a1dc6f97511b64d4139d8.1475128528.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo: quiet diagnostics during startup for pseudo -d
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
X-List-Received-Date: Thu, 29 Sep 2016 15:35:27 -0000
Content-Type: text/plain; format=flowed

On 29 Sep 2016, at 0:59, Robert Yang wrote:

>  ...t-diagnostics-during-startup-for-pseudo-d.patch | 54 
> ++++++++++++++
>  ...er.c-add-prefix-for-log-and-make-log-cons.patch | 83 
> ++++++++++++++++++++++
>  .../files/0002-Use-correct-file-descriptor.patch   | 53 
> ++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  2 +

The second line in the diffstat seems not to be present, but that's 
fine, since I don't think we need it.

These are both pretty simple patches, honestly if the second patch 
hadn't been needed due to a bug that has somehow escaped detection for 
ages, the first would have been Obviously Correct
and worked. So I'm pretty comfortable with these.

-s

