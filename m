Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tdk8u-0005fU-4Z
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:05:54 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so11183671vbm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VySP07lxTow3w5cYP44R4Ex0jbs0iU5DaISI7ilzlB0=;
	b=qnKGuf3Kv1pyg3eH1W863aDf7gkuG0jwm9S/VNE5qwq7fGF819t0mBmdY78bPawixG
	4r4f/19lFgTZCSRLCL2J/Q7Ig6w9JhRlMKimdZMNUcEYuIFSpNBJ7C5j0X9WE2TI3Hhy
	TpO8GSG+FW7RGmD9CVrR2k4I9LYeGMQw8GGixdzEtH6EuGIE7QBJBv8g9MqO23tPOpCA
	hMT+pUjixr4hY0SBwH9/Jp2CrMs0GOZQ05z++awiWuK9RFzONq5FpaIWXsCZvF3+NuLu
	0FXiMWEfBxuTlwYgdusnjBRbxpQXmeBI3I/Ba/hDAGPI2Mj1hMw7OsMPBurpeko5QWaC
	5AqA==
MIME-Version: 1.0
Received: by 10.220.220.7 with SMTP id hw7mr28375717vcb.17.1354117889285; Wed,
	28 Nov 2012 07:51:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.116.17 with HTTP; Wed, 28 Nov 2012 07:51:29 -0800 (PST)
In-Reply-To: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
References: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
Date: Wed, 28 Nov 2012 13:51:29 -0200
X-Google-Sender-Auth: J3KzNDBFb12J9CgzU6ftl5ITGrY
Message-ID: <CAP9ODKo4+FnG=c1m88HeG-MxbzQD-+MyLo85G47Qh_uNcxKJEw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 16:05:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 1:28 PM, Ross Burton <ross.burton@intel.com> wrote:
> Even though the current xserver in oe-core (1.13) doesn't ship these as
> standalone extensions, older X servers required by binary drives
> (e.g. meta-intel's 1.9) still install them separately.  As the packages didn't
> exist in xserver-xorg.inc the extensions were not packaged, and X didn't work.
>
> Revolve this by restoring the package definitions, and moving the upgrade path
> dependencies to xserver-xorg_1.13.bb.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Wouldn't be better for this packaging be done in meta-intel in this case?

My concern here is to leave unused meta-data; I am not a big fan of it at first.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


