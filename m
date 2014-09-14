Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id CE03860017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 21:29:38 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so2962580qae.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 14:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=me7Cn6caHUx9yGLt4gqHJz8LleNx8eWipDeBrx6eM7M=;
	b=YZqTjKm4xg189VfteC5b3jeCLnKpJjKr2WH71E7A1bhrpmSsVBePG3eY2TE6jzpZkE
	YGBLiQvxnxthikHGE1AsBgMuB7Zz1J/1hpDWJBLGz+355D+395Ks9jS0GfrJyIAGjVkK
	6yUk88PZgYN/NrjAUus1O1AVnGpccE8656CBAPN0TT6hH2d1G6Q02WDUboADqbh9bFHY
	IKx1AuEKOpx4oRbs4qmbZ6Fr7CVIn0xMoJ6VbyIpELZo9p6n++yRPix17xtmeCcJ8JLh
	2YtLv37gX5CVtXMpsGKsss0tVr/ht71lwR/OmaF6dGMNWcRTZNjVVCzGtoy+yAHGAdRe
	hiFg==
X-Gm-Message-State: ALoCoQm0lcUpbsXKDy6ngq2XrqTA+/tf9mHq+ZTwlpKhC5w9oVzn5oZWujxVDq/AP7zy+Ojr22DQ
X-Received: by 10.140.94.144 with SMTP id g16mr9863120qge.77.1410730180002;
	Sun, 14 Sep 2014 14:29:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 14:29:19 -0700 (PDT)
In-Reply-To: <4ec99785157dbb7716f3452cc17f5dbf4891ec2e.1410690532.git.Qi.Chen@windriver.com>
References: <cover.1410690532.git.Qi.Chen@windriver.com>
	<4ec99785157dbb7716f3452cc17f5dbf4891ec2e.1410690532.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 22:29:19 +0100
Message-ID: <CAJTo0LYXFF79x7YspAth9vvk9TqQJ5FZBajBKAHWCuHQx5qMCg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] systemd: fix to use ${libdir}
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
X-List-Received-Date: Sun, 14 Sep 2014 21:29:42 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2014 11:29, Chen Qi <Qi.Chen@windriver.com> wrote:
> We need to user ${libdir} instead of ${exec_prefix}/lib.

Please clarify in the commit message that this is for the libraries,
not the actual init system.  The init system explicitly installs into
${exec_prefix}/lib.

Also "use" not "user".

Ross

