Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id AE0F26B40D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 12:27:52 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r71CRnCv029856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 1 Aug 2013 14:27:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1375360070;
	bh=M+dvssbRtZvRqYSNqUg0HCm4qI4sOb6PHCVJUcncefs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=P3RGlbZlMsLEg8/9AJYcftodJ8LblJC7wfQASIqTpZ3dU7lRii8VH38jrsbZaC1qe
	dOgf1q4gpLoW20Bj9uz+dPdQXUuA3ovPxQ+U/ncnpI7RXrN+5Ma/UfXXdH6Us6mSAc
	2ZQENAvmR1SILCDzzUqwKbM3jeqBGAJk+PntRC4E=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r71CRjQ4021439
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Aug 2013 14:27:46 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1V4ryr-0006VP-It; Thu, 01 Aug 2013 14:27:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1375357402-10147-1-git-send-email-muhammad_shakeel@mentor.com>
	<1375357402-10147-4-git-send-email-muhammad_shakeel@mentor.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 01 Aug 2013 14:27:45 +0200
In-Reply-To: <1375357402-10147-4-git-send-email-muhammad_shakeel@mentor.com>
	(Muhammad Shakeel's message of "Thu, 1 Aug 2013 16:43:22 +0500")
Message-ID: <lyob9hwq7y.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
Subject: Re: [PATCH 4/4] nfs-utils: Add systemd support
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
X-List-Received-Date: Thu, 01 Aug 2013 12:27:53 -0000
Content-Type: text/plain

"Shakeel, Muhammad"
<muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:

> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=NFS Server
> +Requires=rpcbind.service
> +After=rpcbind.service
> +
> +[Service]
> +Type=oneshot
> +ExecStart=/usr/sbin/rpc.nfsd
> +ExecStart=/usr/sbin/rpc.mountd
> +ExecStart=/usr/sbin/rpc.statd
> +ExecStart=/usr/sbin/exportfs -a

imo, this should be splitted into own units with a way to add custom
options (e.g. '-p').


>  	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
> +
> +    install -d ${D}${systemd_unitdir}/system

--> tab/space mismatch



Enrico

