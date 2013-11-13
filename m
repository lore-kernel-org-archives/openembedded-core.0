Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC876D7C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 12:30:25 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id x17so216996vbf.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 04:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=up3cs2ZcW1GArWCv82a49mMBPWsdIvK9bxox12cMPwo=;
	b=iitTJMrR+FhkYQqOtFla98tlNKqwPaFujjnthrlMv54WZzLlGfoGxLy0qFtVIdnocc
	LS8iCvymNHaVOGOY6/EoiOk4LmZ3VKQDzQgsg+Wr7laoXm8ydkZdFcwcFuxy5sj1TGbQ
	IVLuM316mw80Mpyc6P2GeoMx2sA3FGSmy4XwG7TO64ceKBGDw5RqeDddYBiAgd//+ZHn
	QBiOmiHwXR6OdFeAoSSxc9hKq1GDilnSAdbvxT1REvFcBO1CblCYOy1NM6FZ5R99mJg8
	tcAziLigU/TtFEjen95HevOw52dZeEw5pdWW/RLmP8UcpnEbiA4R6UWFy2C27k1ZCq7e
	kIew==
X-Gm-Message-State: ALoCoQnkr0DWZJtRA8asMAGB/Y18zn6CJ8AQUdqWuYRkTJ0zMEFMnkyGhgHB9xeCWD19vCV1awjl
X-Received: by 10.52.118.73 with SMTP id kk9mr28850029vdb.13.1384345826185;
	Wed, 13 Nov 2013 04:30:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 13 Nov 2013 04:30:06 -0800 (PST)
In-Reply-To: <1384337335-32231-3-git-send-email-hongbo.zhong@windriver.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-3-git-send-email-hongbo.zhong@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Nov 2013 12:30:06 +0000
Message-ID: <CAJTo0LZZhEF5S9anD54RrrVyGe07KkdNhTh1gz=giRJk_n7k7A@mail.gmail.com>
To: Zhong Hongbo <hongbo.zhong@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez4: Fix no moudle named gi.repository and GObject for simpel-agent
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
X-List-Received-Date: Wed, 13 Nov 2013 12:30:26 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2013 10:08, Zhong Hongbo <hongbo.zhong@windriver.com> wrote:
> +++ b/meta/recipes-connectivity/bluez/bluez4-4.101/fix-no-module-name-GObject-for-simple-agent.patch
> @@ -0,0 +1,25 @@
> +Fix No module name gi.repository and GObject for simple-agent
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>

Patch needs an Upstream-Status ("Inappropriate [revert]" would be
suitable), and please rename the patch/comment to something more
accurate along the lines of "use legacy pygobject instead of
gobject-introspection".

Ross

