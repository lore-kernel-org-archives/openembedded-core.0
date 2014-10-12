Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 321FC718D5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:49:55 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so4167402qcx.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 13:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ityeMSrNsmUJd5PyYC+4IN1vupxrkb0wlzD0PqfUzJE=;
	b=kNj4dMPyG+47iHw1eTTJdQS+5bgMQ82QR+SJiC/Ctaj8dFrg6Nc5kqnayj2vINM7uP
	KIHwOAumQZ55IQXmZTaI3vaSCljZ/9pCRSSxdKki8hPKwDK7iDiN9y9scJfBympDeCkN
	5XYXwONjzqi1NTjCJqfk2Il9do7+QT3mNeHctUZXNOGEajsag08dF76ZKUHzfCR1wA/5
	oUDA2HNj3C+INPAWUu45jIgCH7/k3y31f6WfbUesE1Ms9SNiCRgaR9Dj/VbMrQe9Sxdw
	zcT8kaPxc7nhIgwAnck5I3cCQPhDRaxQpwStIgHsysCtkGuKu4hMizcZf3KcciL78Cyp
	H01g==
X-Gm-Message-State: ALoCoQkQ5rF2OgneDX7MxTLma8ojUgLQkJwXZLf6V0LKX1penn7KLjlTv5nUBKrpB2PBmn1TSKlx
X-Received: by 10.229.192.71 with SMTP id dp7mr19220251qcb.5.1413146996514;
	Sun, 12 Oct 2014 13:49:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Sun, 12 Oct 2014 13:49:36 -0700 (PDT)
In-Reply-To: <CACS+7ZTreU8-5jVr7SfBMP3Ogr9Q6XYd2TgQA=7-Tepf6z0PDw@mail.gmail.com>
References: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
	<CAJTo0LZDeTCp7E3ZMX6To6Ox-bOLS625d_T2QBjjuQ+RZ7==dw@mail.gmail.com>
	<CAJTo0LaP2Zu7z8Dp_1uCzkdLuBS_TgZ0xn0CXg5QtNTt3ZCAbw@mail.gmail.com>
	<CACS+7ZTreU8-5jVr7SfBMP3Ogr9Q6XYd2TgQA=7-Tepf6z0PDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 12 Oct 2014 21:49:36 +0100
Message-ID: <CAJTo0LZ0Pioox8tXNdCzuV_pof8axcBAi4A_y6rdLqNLqhLX3w@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Sun, 12 Oct 2014 20:49:56 -0000
Content-Type: text/plain; charset=UTF-8

On 9 October 2014 17:57, Dan McGregor <danismostlikely@gmail.com> wrote:
> I'm using git imap-send to gmail. Perhaps it's corrupting it. I'll double check.

FWIW, I'm using send-email to the gmail SMTP servers, which correctly
puts the patches into my sent mail folder if that's what you were
using imap-send for.

The patch is still corrupted, but I found your branch so I didn't
bother investigating further. :)

Thanks,
Ross

