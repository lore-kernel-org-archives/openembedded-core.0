Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIONZ-000449-Qp
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 20:08:57 +0100
Received: by mail-vc0-f175.google.com with SMTP id hf12so1600035vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 11:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=SutdpEexk0V+Th/minn/bdSOlte7dfBT/GApkFsw/1U=;
	b=KGjiLIR01LCZxKYoqurVgjvf78NAIfKPHM4XtKYiE6+I4ByIWX5ofNBBD5BavwtNDq
	LFcXaM7Z0ObMeCC/+cYGzJ7/2/2NsneDEHWykSGSBmgtDOqMqnovQ7TIg+PvVQQBDEj+
	y5JDBqiS3iQpLWm4Q+pcc7/lipxVnwW3LC/rUYUvhMF6w/vGjmtEGqy3hHegSMOtjhCQ
	WatgxXJPOLZwqXxbjns3EC3wT05nhQMC1mjluQa9aAXENuUWTSbDjGPZzX+3F2+Pu49M
	e+cYyCtcJSLIsxciSo5pJgcC3klZtP6z58GjsDv2TQhClgJO0RnRD16T56osIkKPMY/R
	0OaA==
X-Received: by 10.220.153.143 with SMTP id k15mr9633469vcw.13.1363805522201;
	Wed, 20 Mar 2013 11:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 11:51:42 -0700 (PDT)
In-Reply-To: <lytxo6rlc3.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1363673104.git.Qi.Chen@windriver.com>
	<face120c816e78dffad876f43218920c1a7da423.1363673104.git.Qi.Chen@windriver.com>
	<lytxo6rlc3.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 18:51:42 +0000
Message-ID: <CAJTo0LawTmAtJ0AFcisNfiZEnD99y3BZBG6Ju5=oajh+E2Yr_w@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQnwQ8AFvkPFNvtnN5VEN7VqALV/xIQ6vYiPW5c5btvU8uWPpJnLvXlrks8kposgK2F2sZMM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] util-linux: better co-operate with systemd
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
X-List-Received-Date: Wed, 20 Mar 2013 19:09:01 -0000
X-List-Received-Date: Wed, 20 Mar 2013 19:09:01 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2013 18:13, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> nak; this should go into an own subpackage:
>
> * the socket itself is broken: systemd tries to create the /var/uiidd/request
>   socket which will fail on ro filesystems.  It should be moved to a
>   volatile location
>
> * util-linux contains lot of other programs which might be useful for
>   other purposes; having a daemon which is activated silently is unwanted.

I should have said that's splitting into a separate package is one of
the changes that I'd made.  I didn't realise it was using a stupid
location for the socket, I'll fix that up.

Ross


