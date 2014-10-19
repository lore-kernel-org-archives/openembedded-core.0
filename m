Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id CAA37601D8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 18:37:28 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y10so3591735pdj.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ImfjFpSkYomLfuY1gpbZQc4k8IvtUg+TFDeyVkteO78=;
	b=nKfs2nrUKKqSBWKMotpJkJ5YcRRfcQjXVkr/qWu3RLHq/lY86DirYLnpnXCxvDh3Z3
	cnIHVcfPyZ4gCSZCg86uWdEQb8YZUGOHN0n9x+rZ8612KF7gqjuc9iAADSMz2jKIdZ5G
	f2/2CwCJ5jBW8DTRUXOrMaBmmr3G+4kmo4ivzyCEIAllVS/Wf8NcakPwKjl+Tu99Rs1e
	BIWVegVZ6NRyKt87smHwVm39ir8z5RO828uoNae1CBDyFdIWKOuYMGD83dUdIrNTvg6f
	l0a2akPflm3KCqnNwgq8cbyOkHP2og4CvxPkHALA6nief3Ah3v7XyjJw4N6D3OQLfkDG
	BdJg==
X-Received: by 10.70.128.239 with SMTP id nr15mr22533941pdb.32.1413743849636; 
	Sun, 19 Oct 2014 11:37:29 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:1cc9:bc0f:a205:6dee?
	([2601:c:9380:601:1cc9:bc0f:a205:6dee])
	by mx.google.com with ESMTPSA id m2sm7148898pdf.48.2014.10.19.11.37.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Oct 2014 11:37:28 -0700 (PDT)
Message-ID: <544404D7.9030905@gmail.com>
Date: Sun, 19 Oct 2014 11:37:11 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Poky X11
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
X-List-Received-Date: Sun, 19 Oct 2014 18:37:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



Hello,

When I build 'core-image-x11' on Poky, X on wont start. I am using the 
standard Poky clone with no added layers. When I manually start x I get 
the following error:

startx
/etc/X11/xinit/xinitrc: line 95: twm : command not found
/etc/X11/xinit/xinitrc: line 96: xclock : command not found
/etc/X11/xinit/xinitrc: line 97: xterm : command not found
/etc/X11/xinit/xinitrc: line 98: xterm : command not found
/etc/X11/xinit/xinitrc: line 99: exec : command not found

I suspect I am doing something wrong.

I found that the missing files are in 
meta-openembedded/meta-oe/recipes-graphics/*.

If this is a bug, which direction should I go to address the problem?

1) move missing recipes to oe-core
2) remove core-image-x11 from oe-core
3) remove files from xinitrc
4) none of the above, issue some where else.

regards,
Armin

