Return-Path: <walters@verbum.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAF7607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 13:29:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id E847F20AC9;
	Tue,  2 Jul 2013 09:29:23 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute6.internal (MEProxy); Tue, 02 Jul 2013 09:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=9tXE2ZLMktjV9q5569prgh
	YIcmU=; b=jW1dHlMUKWlPw5BtB2t6FbCfkbkqbqaipWXDow4OLtpToGJa59gaBz
	ifNch7sMNsIiRy9O7KAO16AVtlKplL1z/fqd6j+1yPEyjKpE87yOpw6WPtt4ne83
	JP3Yz8OxjbGWGqWw1xVogWL5WqBTV5wY2hj3Sub2zwt5xaLJnjCA4=
X-Sasl-enc: kxiZsXKIKelR6AiGrrx6n0pIoxiIdiqT4/jn/Uw8is1O 1372771763
Received: from [192.168.0.12] (unknown [173.88.94.148])
	by mail.messagingengine.com (Postfix) with ESMTPA id 946A068044E;
	Tue,  2 Jul 2013 09:29:23 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Yevhen Kyriukha <kirgene@gmail.com>
In-Reply-To: <CADV-EXEu9adLK7ArMTZv30gTdppzPwMpNMC1JPpVhSm9jQqTag@mail.gmail.com>
References: <CADV-EXEu9adLK7ArMTZv30gTdppzPwMpNMC1JPpVhSm9jQqTag@mail.gmail.com>
Date: Tue, 02 Jul 2013 09:29:22 -0400
Message-ID: <1372771762.3791.50.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-9.el6) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Create btrfs subvolume during image building
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
X-List-Received-Date: Tue, 02 Jul 2013 13:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-02 at 15:04 +0300, Yevhen Kyriukha wrote:
> Hi!
> 
> 
> I'd like to create image with btrfs rootfs partition.
> I want to store all files on separate subvolume on btrfs partition.
> For this purpose I'm creating *.bbclass that simply extends IMAGE_CMD.
> 
> 
> The problem is that to create btrfs subvolume I need to mount it
> first, but only root can execute "mount".

Another option is libguestfs; recent versions support btrfs.




