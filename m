Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7161A70101
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:27:55 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id v202so84750431itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 02:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=8wfOhZKYA2OVfhlZ0zzOkh9+xx9rIp5Km35o2Gwrm9M=;
	b=u8eVpiDIhCSSbr7rWIZeCouHbdyO1NBItzXdaCAe3AGkVI459eflYlPF+YLlWk4gN6
	gJR92yB/KhreqJ/xtDCTrDCJH79D3RaQyEI36aqwE5Q7oi2lcCDsESkmP27EgIdria9K
	mwdQ2XSL7fMXg6DmkVnVdPLPlS5cv0S6Iq6wWe0upWQt64yKqDucOMZYc0wdA3SVG+2j
	T79oYD4iYGSkXnceDfHpuThd1dMxLa9aGW7OUMpt2G1IN5Gc7/saex71RJfgJ8N9Acdt
	w1T0sohgMiVtRQ35Eoj5iez3i53PhxZ2xy3cqb6rbQnjmiq23f3G3KWysPH68QnWdrd5
	KyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=8wfOhZKYA2OVfhlZ0zzOkh9+xx9rIp5Km35o2Gwrm9M=;
	b=ImQymwPZNXx6BC3PzOSFpKpS1jRkPcEZ7/8KUMDks2fBYuCO85sX3gExr+0vqZdAPk
	KaqiAbiwiZM9LwPpm5yMHOpdQ7b/4y++iGSZFM/DK8FpHEu3Xce666ePopPMms2HmebA
	MdCsY8wF7AV64oMnrUe1VFkBHSd4CyxRkxsqimeicAq9WYkCf+Y4NonvC4iD5k582m4x
	421y6jCgsR2uqGwqbF+DEwE+awslAdZTFtvHvv3DXGibEzi5rY4JR5Dn3OWvFJJXLXB5
	6rcGJTBxh8wBv3nfidK3dNq4Obus7Q9vAWUSPBHr+yniNO/uMNjs+wct/SP44CFkFzJQ
	p7ng==
X-Gm-Message-State: AIVw111T6Wche3eZPLEG2YFsHl8bta7XADEn7UM3BR9W10mYn86Ul1f/
	0uiIOIQhKrh+nef3
X-Received: by 10.36.6.200 with SMTP id 191mr8063490itv.44.1499074076672;
	Mon, 03 Jul 2017 02:27:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF7A.dip0.t-ipconnect.de. [93.232.239.122])
	by smtp.gmail.com with ESMTPSA id
	z64sm8201501iod.55.2017.07.03.02.27.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 02:27:55 -0700 (PDT)
Message-ID: <1499074073.5259.74.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Mon, 03 Jul 2017 11:27:53 +0200
In-Reply-To: <20170703083602.GA5532@linux.intel.com>
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<20170703083602.GA5532@linux.intel.com>
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
X-List-Received-Date: Mon, 03 Jul 2017 09:27:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-07-03 at 11:36 +0300, Ed Bartosh wrote:
> On Fri, Jun 30, 2017 at 10:53:30AM -0700, Alejandro Hernandez wrote:
> > When using wic to create an image from a certain build, wic is expecting
> > to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
> > which is wrong, since the initrd file has not been copied to the final
> > directory yet,
> 
> Is it possible to ensure that initrd is deployed before wic is run by
> making do_image_wic depend on initrd deploy task?

Not in this case, because both do_image_wic and do_image_cpio share the
same deploy task.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




