Return-Path: <pderocco@ix.netcom.com>
Received: from elasmtp-dupuy.atl.sa.earthlink.net
	(elasmtp-dupuy.atl.sa.earthlink.net [209.86.89.62])
	by mail.openembedded.org (Postfix) with ESMTP id 859B277005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:52:01 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=dk20050327; d=ix.netcom.com;
	b=kerZlnA6GPW2CUY0LFqCovmQHyESMEEt+x9KIpDEtZqkIZD+oCk/26Hp3h/yOLeQ;
	h=Received:From:To:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:X-MimeOLE:X-ELNK-Trace:X-Originating-IP;
Received: from [45.49.236.199] (helo=PAULD)
	by elasmtp-dupuy.atl.sa.earthlink.net with esmtpa (Exim 4.67)
	(envelope-from <pderocco@ix.netcom.com>) id 1ZcNQa-0005mm-MZ
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Sep 2015 20:51:56 -0400
From: "Paul D. DeRocco" <pderocco@ix.netcom.com>
To: "OpenEmbedded list" <openembedded-core@lists.openembedded.org>
References: <DECE55FFDD9A4BE0A917289E0F6A7775@PAULD>
In-Reply-To: <DECE55FFDD9A4BE0A917289E0F6A7775@PAULD>
Date: Wed, 16 Sep 2015 17:52:01 -0700
Message-ID: <2F27C16D6CE947B9A299856B9910FE9B@PAULD>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdDw0wWnqPVV1P/mSsK3xw4ExAFkqgAD9V8w
X-MimeOLE: Produced By Microsoft MimeOLE V6.1.7601.17609
X-ELNK-Trace: bd7d5d4e6f8f652c74cfc7ce3b1ad11381c87f5e5196068832979921b0c8eaedae3049f0dd2bd8ec350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 45.49.236.199
Subject: Re: Migrating from Samba 3 to 4
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
X-List-Received-Date: Thu, 17 Sep 2015 00:52:04 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> From: Paul D. DeRocco
> 
> A couple years ago, I included Samba 3 in a Yocto (Dylan 
> branch) project,
> and got it working. It included a custom smb.conf file, and an added
> usermap file. I'm doing a new version of that project using 
> the Yocto Fido
> branch, and incorporating Samba 4, whose recipe works differently.
> 
> To provide a custom smb.conf, I simply did the usual 
> .bbappend prepending
> my own files subdirectory containing the new smb.conf. The new recipe
> copies smb.conf explicitly inside a do_install_append() 
> function, so never
> looks for mine.
> 
> To provide a usermap file, I created a do_install_append() 
> that created
> the necessary subdirectories and copied the file. Worked fine.
> 
> Neither of those is working now. The final sysroot contains the stock
> smb.conf and no usermap. I'm a bitbake near-newbie, so I need 
> some help.
> Why wouldn't my do_install_append() be called? Isn't it legal 
> to have one
> in the .bb and another in the .bbappend?
> 
> And what is the now-accepted method of supplying a custom smb.conf?
> Copying it in a do_install_append(), or by running a little 
> script with
> ROOTFS_POSTPROCESS_COMMAND? Is the latter how I should be 
> doing both of
> these things?

Never mind about usermap: that was cockpit error.

I'm still left with the question: is there a "standard" way of supplying a
custom smb.conf file for Samba 4?

-- 

Ciao,               Paul D. DeRocco
Paul                mailto:pderocco@ix.netcom.com


