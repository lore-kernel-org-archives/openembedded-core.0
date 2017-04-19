Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E85D271AD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 13:03:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so4884372wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O7e2FrMcDL3qCLw94Mvmv21fuCd2UEN9Egn4ueUIOyQ=;
	b=Es2innl5UNciAzYyFDS+nJR3OujkS1PPMO/RoXCmKNra3eKOiCK2gl94tf0AsifWn6
	AYgFauDpeB+AJ8NIcNwdhXaeyj3zOK2DhhwzHG/yhycjLeFnsaBxAUdgKKHfbK49ldMQ
	LL/C3g/TFWNxhmfSeJVRfpSEovUv01/OdclFxCMzWuRwkFL7Q/8HPq0qToIwTglZZ2Pg
	akEOx4A+2LhgpeGRFATk2k/PUgmqM7d9oQHZ2rAxdbnR+B2JFjB22Ro1t4EQDyzm/cyv
	+OvnCtTRARzVkOXXGBpb7Qqt0+BZGARjd9eW8iHh7f6fDEK71hkpWB/D716TZQzXTc7I
	8N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O7e2FrMcDL3qCLw94Mvmv21fuCd2UEN9Egn4ueUIOyQ=;
	b=os4m89v2VISvEdTy/O0n3cVp1aZW+kZyfjm8YQfKmICjQHW4itRVlPPe2zUyCUQP+q
	UDYHncSetwpmW19OwsFKUFG/yDf/gdSJMqI4j1DnA5RWGZuUNTDjEmFg9JcrTJp2oWg1
	HOgeQ4Yh3GUwpFVh599DdnDJFzKFAkM9TSwhPBJWLAv6AD1OfLyv8MoBSWgFtNx2WKE1
	11cyvVKkPseFy8H+eBMqvpe8HoWa6eMtoZralfFKtB7NbrlZlBeksBUdzeWxgjXZ9aSb
	USXd7Z4TYsVWucsJc6ad9iQ6Pcr/TV3zr112wvzvAdTuAkRZQFJ5aS3XdkTz9gA2sLxn
	dd8Q==
X-Gm-Message-State: AN3rC/58svHukfy6r3wGpyQOwMekimlS0/wYx15vJQEOW8UBm/MPq/iX
	RFnZdQfLjFl2W3ed
X-Received: by 10.28.54.7 with SMTP id d7mr17182951wma.114.1492607025650;
	Wed, 19 Apr 2017 06:03:45 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	k45sm3277918wrk.15.2017.04.19.06.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 06:03:45 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 19 Apr 2017 15:03:42 +0200
Message-ID: <5023360.N8L8OyXh3V@crde-port-20.cahors.local>
In-Reply-To: <64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
	<64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Wed, 19 Apr 2017 13:03:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On mercredi 19 avril 2017 13:57:40 CEST Alexander Kanavin wrote:
> On 04/19/2017 02:53 PM, David Vincent wrote:
> >> This kind of thing is better done via ROOTFS_POSTPROCESS_COMMAND, I
> >> think. Look for examples in rootfs-postcommands.bbclass.
> > 
> > The problem of ROOTFS_POSTPROCESS_COMMAND is that it is a one shot
> > function
> > that is run at image creation. In my case, I must be able to upgrade the
> > package over time via package management tools. Sorry for not bringing
> > that up before.
> 
> What is it in the openssl config file that must be managed via package
> updates?
The problem is that I must be able to manage the configuration of a machine 
without physical intervention and only via package upgrades. A new 
configuration can be applied simply by incrementing the PR of a configuration 
package.

But maybe this is a use case only needed by me and I should manage it in my 
own specific layer ?

Now that I think of it, I have the same kind of problem for all machine 
specific configurations. For now, I just replace the PACKAGE_ARCH in my BSP 
layer with a machine specific one to indicate that a package contains a 
configuration valid only for a specific machine. Maybe, in a future release, it 
should be desirable to create -conf packages based on the CONFFILES variable ? 
I don't know if it's a good idea, but maybe I could bring that up on the 
architecture mailing list ?
> 
> Alex

David

