Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8CD60111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:38:32 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id d9so212775419ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 00:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=GxY764S+7KZxQRCwng7REC55TLAKR+5OC4MqZ4jLA6o=;
	b=0NcvtNaj+qcVN2SK23agwpCA06swMJ9BXrvQlZbesJ3cpZ9xpF8Wlrh9MF+Px7VwZU
	4eBG7QSqI/WPzg/qIFFoJCgfqHP4WHTwDXvIGy1vfMPbfy3NMi9CisGFP1oZ4ApWznlD
	FApglAuhql1Z3jxwB/u6MCnUVcEEWsbvqJL2nareWdn1L/H99MigT7iXq+zRagqVR8Y1
	+uRJsZArfzvIuinv880V6jIqV47UNrItUzfp8i4XlH9kqMsO4qsBysOpEOdlg3Q1fTpD
	Se+jXuBahAnCW4PtoWvZuT1sG8b7zwbZ97u2SYeOkZZXxFQ11UJZVOZBk+5eiQhofOq1
	9rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=GxY764S+7KZxQRCwng7REC55TLAKR+5OC4MqZ4jLA6o=;
	b=F0z8A3YkXOzin7SNev1UjmyxP+oh0LELRIKL7qzmHbeIEcHudCL32Y0fyP+T/va2ML
	KiNofyg6GVlZW2F3HGE8hx+d4vyWIR71+CFOGCLkfmnVAF39lPRPjLuJr4H6UR4XtsnN
	ugCI6DRsuEb83txGpS7hVAerbD/zbbjZWV7PIPeOc0mTWRpx4k56wJvpM7CvWCKVZtYc
	MHqg3w+zFn/H6ZNlygeh4/RJgwlP2MWDTnv6WGdYXVoWS7bMgnYx3ESH4BCehdZ+9fL2
	94BT45oqDT9f5wDLoIOR509S1MpEC5HFwVs1IbEXoR/KLrk6kGbKoUTxuHQtYx9rFAxr
	di3g==
X-Gm-Message-State: AKaTC00cNEWTzo7HNwUrqLjqlakUn1kvVSjtgsBKUqeU7mRtJu8A7o/kGl6nHU239M3AD+NS
X-Received: by 10.107.1.138 with SMTP id 132mr84781145iob.72.1481618313808;
	Tue, 13 Dec 2016 00:38:33 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F3B2.dip0.t-ipconnect.de. [93.232.243.178])
	by smtp.gmail.com with ESMTPSA id
	m83sm21000423ioi.11.2016.12.13.00.38.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 00:38:32 -0800 (PST)
Message-ID: <1481618309.17535.260.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Tue, 13 Dec 2016 09:38:29 +0100
In-Reply-To: <6c128696461dd6e37818cbad168a048575b97f5a.1481616098.git.Qi.Chen@windriver.com>
References: <cover.1481616098.git.Qi.Chen@windriver.com>
	<6c128696461dd6e37818cbad168a048575b97f5a.1481616098.git.Qi.Chen@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 4/4] package.bbclass: support persistent /var/log
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
X-List-Received-Date: Tue, 13 Dec 2016 08:38:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-12-13 at 16:04 +0800, Chen Qi wrote:
> -            fs_perms_tables = 'files/fs-perms.txt'
> +            fs_perms_tables = ['files/fs-perms-persistent-log.txt',
> 'files/fs-perms.txt'][d.getVar('VOLATILE_LOG_DIR', True) == 'yes']

Now that the rest of the changes treat VOLATILE_LOG_DIR as a boolean,
this code here also needs to be changed. Otherwise VOLATILE_LOG_DIR=1 or
VOLATILE_LOG_DIR=y won't work correctly.

You might also want to change the description of the variable in the
first patch to mention those other values.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




