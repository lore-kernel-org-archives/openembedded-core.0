Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QK6iq-0007YM-JK
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 12:32:52 +0200
Received: by eye27 with SMTP id 27so101827eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 03:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=Q3dw7peAaH7t7HWQ7H5E6harQ3RmzsKtg1R14lfjcoI=;
	b=N3Ijo8YcTW9aEQV+QHG1y2tP1H8J1JntecysgLnc5LS6ZD/NvbhATksS10EXXGglfP
	ZpAf5g4H69kJhiYp4cBYXnOHC0n8FZbnRXyt89Cnnhwic1B2kQuIXFbcwZogK6qsW0fm
	1n18RXlvsZy8S/chCMDGHgckhibtemiBVu4r4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=k2AOT/w0VVpkrnS1ec6hOwfDxs1ZqGpKzQc7h5j9XXaanU987e2Ihmh2198Vm7K6cz
	wg3ofT3VQIFRZpc5uHY2GaiOJp9X4G+RUgfbeBu4rZjYIMH3Sd3dGX0fNVTMPYBNYilU
	i9mwYX/IWDx9PP1Q7iGypHTwqnoLQZ6uiXnHc=
Received: by 10.213.26.195 with SMTP id f3mr163567ebc.50.1305109806063;
	Wed, 11 May 2011 03:30:06 -0700 (PDT)
Received: from localhost.localdomain (095-097-098-131.static.chello.nl
	[95.97.98.131])
	by mx.google.com with ESMTPS id x5sm5007898eea.14.2011.05.11.03.30.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 03:30:01 -0700 (PDT)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2011 12:29:47 +0200
Message-Id: <cover.1305109178.git.leon@sidebranch.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Re-add powerpc-linux-gnuspe support.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2011 10:32:52 -0000

From: Leon Woestenberg <leon@sidebranch.com>

(Re-)add powerpc-linux-gnuspe support, as from OpenEmbedded.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: likewise/gnuspe
  Browse: http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=likewise/gnuspe

Thanks,
    Leon Woestenberg <leon@sidebranch.com>
---


Leon Woestenberg (1):
  siteinfo.bbclass: Add powerpc-linux-gnuspe.

 meta/classes/siteinfo.bbclass |    1 +
 meta/conf/distro/poky.conf    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)



