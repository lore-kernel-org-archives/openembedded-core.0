Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 08048731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:18 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id 77so18900184ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=fxQnB3Hv4KddKWC9PdCLtsEni9kG862eqW9L/3Mx7wg=;
	b=NPOw9v+nk7BeJfHt17hMWTI3bcewb14v3Uc3OpZlnN9bKuVq52H0nARe3ZXXgzs2Vd
	FX3wbGTTsLXHNUz54AhlxgZfFl1xSUDqwhXSuN+bxfzZScKzLDg6YoIcNsIR6Mkb0TXe
	lCJVokXqV72q7IDb6z+23k55eV/0luijXWbmwQA4eYebqeSUMyA0LjxTGjfYA2GrT+Op
	8tKbxRZckKSFSrZ2mwjn8YKur3BtUL6bd45D6l96c6HXflVguOmH2AU7K/gQrMYlfrrX
	m4cJrWTiSemlxr4W1OOT6OZnkyHW/1PXNwZ9XNi3lzeb1PxvvZaS2xj4m4Lf9bHhM1ux
	1Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fxQnB3Hv4KddKWC9PdCLtsEni9kG862eqW9L/3Mx7wg=;
	b=cJZb9Ro5ik7rEosaJPhEBR+L9T0Z4CPhWuHR9/Zh0hw7W5GlSI8Po9sJZW8I6tNPdZ
	JtkKwPIsaI67CiQgGC49+BjlE6NKyjT/woOQgz7PyBvpSd47GLVOT50pjxMRkAKteeI5
	ik6QxyRMmgyYk4dPjR0HzQiijpSv6643G5qyvwUVqF3qHMz4rMQA1nepv/ab9HycxdL4
	w7h2y2o6LTyDYbdYRERIRrGpS3vuOyAUjVvTl3s8yDz25xKPqNG28kC6SvE++mgBP4so
	R507erTQ3HrvKDVA7+/Am08QdpAx00/kxwObD3m0ugypiyWtD5BStQ95MWsXp7dOMqrX
	cEPA==
X-Gm-Message-State: ALoCoQnxi58kKue8s3yGk94ipq+Z9ML5HBzN+bHSyfgxrdjtT6B18Pc6sb7M9wKyE6xf7zagAQAU11Dda93nTWP9T5IUE7QZHw==
X-Received: by 10.107.62.4 with SMTP id l4mr6164259ioa.45.1452805099622;
	Thu, 14 Jan 2016 12:58:19 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:19 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:28 -0600
Message-Id: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [RFC][PATCH 0/9] cleanup packaging of bash completions
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:20 -0000

Recipes in OE core and meta-oe (possibly others too) package bash completion
files in a similar but inconsitent manner. This patch series adds a class
bash-completion.bbclass that creates a subpackage containing files installed to
the common bash-completion paths.

Prior to this series some recipes created bash-completion subpackages which had
no RDEPENDS, others with bash-completion and yet others with bash. I decided to
have the class add an RDEPENDS for bash-completion and move bash-completion to
OE-core for this reason. If someone has a different view on what should be done
please, speak up.

I'll be posting an accompanying series to openembedded-devel for meta-oe.


