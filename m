Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7A22878231
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 18:43:44 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id r36so28806621ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Ixsa3fWRRElu/Lqb4B0Gat9YHsgx6RQHoWqZgS8tQRo=;
	b=fMwbmfncxmIq9lvBIrfPap/wT2L3/Kn0JmE1Z6HUPcPw2juEuaWhK/bhbvGFwMd2Wz
	hwOBdaGB/L+zMcvqMRroUlaBeL8pfi/vtJTFCxrOwNbbazZ6AlSRdbPlqYrilWLVB4Dy
	D/hM+PaDqOQv1XoEpwAnYqDj+C3VJbLoIhzISm0H3e6Jnfhfw+QBRrNcHEcIJL7NwW23
	N8U0XHPtWwvhXUzcZz+lqHXkdXjHPl+0Baxvj3IVIc6qIScP/m2XyfJvl3k2di6FPMZr
	Dy5R+dqD32qRs5lJ2VTvKowcGT7ye8gspHGJw9n+ZHnVYA9to6csdZT7+OBnfwKT65R1
	2O5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Ixsa3fWRRElu/Lqb4B0Gat9YHsgx6RQHoWqZgS8tQRo=;
	b=PrXKosr5b3xq4SgMIJm+AzYbpkN7I/z9BR8wVuTsdfmMG0SOSTlWBpd2Eevu870m/3
	RSuiSRimNnsbHkZbSLMUwNJW2Eg1X765rInI2bEUsvu0CnlAvbBdHGlZStoxIO6EHnmu
	29ulUUsqHUdseTx3vmf5QiwWRx8yRAmQquz9mi7lGp1xTP4Zm4u+FYc0rsekQ1/IvG4U
	D6kv+PhsMH9P6oYTUcwqoGZzKfVNJw22H47GcJeiqnTMGf+UmHkKaEOKQ1CL5YF8ofgc
	FzjcXM+wZNO2epR59vs5gSmNHZiTypgXT1EG4tp8cnR0BN/dwBpVF5ld4C3ScrwN3PFo
	6Mjw==
X-Gm-Message-State: AKS2vOzltJzHNQfW/BTGca+05PRYmvj05cQslhoJ+hmr3u3E+n7+n1t2
	RWemEw6ZSG1eE5LU
X-Received: by 10.107.168.39 with SMTP id r39mr23022550ioe.45.1498848226278;
	Fri, 30 Jun 2017 11:43:46 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FA66.dip0.t-ipconnect.de. [93.232.250.102])
	by smtp.gmail.com with ESMTPSA id
	y64sm6262474itb.31.2017.06.30.11.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 11:43:44 -0700 (PDT)
Message-ID: <1498848221.5259.13.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Fri, 30 Jun 2017 20:43:41 +0200
In-Reply-To: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Fri, 30 Jun 2017 18:43:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-30 at 10:53 -0700, Alejandro Hernandez wrote:
> When using wic to create an image from a certain build, wic is expecting
> to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
> which is wrong, since the initrd file has not been copied to the final
> directory yet, so instead of trying to use an initrd file from 
> DEPLOY_DIR_IMAGE we get it from IMGDEPLOYDIR, which is the directory 
> where the resulting images are placed before their final destination, 
> and its where we can find the correct initrd file for our image.

Can you give an example with some real image and initramfs recipe where
this works? In other words, provide an example where the old behavior
fails and the new one works?

When using core-image-minimal and core-image-minimal-initramfs, then
both have different IMGDEPLOYDIRs, therefore code in core-image-minimal
can only find the .cpio.gz in the DEPLOY_DIR_IMAGE. So to me, the
current approach seems correct.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




