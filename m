Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AFC9C6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 09:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u359eCYZ017059; Tue, 5 Apr 2016 10:40:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uthuHqUEJZwk; Tue,  5 Apr 2016 10:40:12 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u359e6QC017056
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 5 Apr 2016 10:40:07 +0100
Message-ID: <1459849206.7348.161.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hains van den Bosch <hainsvdbosch@ziggo.nl>,
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Apr 2016 10:40:06 +0100
In-Reply-To: <1459801968-2522-1-git-send-email-hainsvdbosch@ziggo.nl>
References: <1459801968-2522-1-git-send-email-hainsvdbosch@ziggo.nl>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] Revert "gstreamer1.0-plugins-bad_git: Remove obsolete PACKAGESPLITFUNCS_append = " handle_hls_rename ""
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
X-List-Received-Date: Tue, 05 Apr 2016 09:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-04 at 22:32 +0200, Hains van den Bosch wrote:
> This reverts commit de9456df7d1591eac56b522cae853b77e7cf4e15.
> 
> It gives a smooth upgrade path from gstreamer 1.6.x to gstreamer >=
> 1.7.1

This never made master, only master-next so I'll drop it, no need to
revert.

Cheers,

Richard

