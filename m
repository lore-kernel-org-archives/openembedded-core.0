Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD9A71B87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:09:34 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c13so49561825lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 01:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jNE6u5fgq83KmuqVvSTB+AO2YZLwGOYn0f3rFRanUn0=;
	b=aXd1IXeNc6x4O3hCtyo8mdQX6uV76NvwAF0ei5Fl+MjzUVcwsYaskG2QeBeOcnWzQd
	WYsl5PLtXEcKtcCgYzugVR7U/TO6z0kBqcqcwXV1QhowM2sUwilYeZawvKtrmfqkAc6t
	gu4GK8E6iqa71e3Vd3pKYzYPD3occ5S9eNibtPDXSydi3gJfuYNMxHkPGPQG00EtuLKo
	477TOnOAqNy6D2ake19hocMM7BK+nwBMRkf7WuOO2/4XtUo7LghydUFQ6sSg99ntm1n0
	Z4fbNvy9TiD9ZRVgyGqh05BmXzT1jS85EmALDZOc5hz83PE8wxfaoB2UeP4x9ZbDuPHs
	DVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jNE6u5fgq83KmuqVvSTB+AO2YZLwGOYn0f3rFRanUn0=;
	b=qj5OxlTwJ3PMXQSyOI2dmdXTkD+aCFEppPa/FzjwYItkfRCVKVZzQqLm6+ubU7oR9j
	r6sF+aCMAhljCCV1cUFftsM+vxDBYWfsQQixp1zDDrooPxNL6Es5QzBMbQdxINEvdKJ5
	VdSqGyIfD/HsFXRGjK3dj2mOQKtVkp57AEfzZfIINplrPHZumN7PdRjLLU685PM0198X
	kECR+NGBMBe9fc177z5CODvza75TTkjxqLIMECuRT2T9y2lZBcf/8hBmegSg+G4hMb5A
	6OwSmGrUK6f+CcGQMZtFeRYQIpO77JfME3MxC2WhufxVgLpx/Ob0oA8nlvv6FXv04a6s
	3MaQ==
X-Gm-Message-State: AIkVDXIiT4A6Y5BX1qYKS4dUKGWaYXXiFW++yJnbc5ITf+faHNCzPmG/NTAK2NafX76MwA==
X-Received: by 10.25.23.229 with SMTP id 98mr2570256lfx.41.1482138575808;
	Mon, 19 Dec 2016 01:09:35 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	18sm3629494ljj.7.2016.12.19.01.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Dec 2016 01:09:34 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 19 Dec 2016 10:09:22 +0100
Message-Id: <1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20161216144423.GB6398@linux.intel.com>
References: <20161216144423.GB6398@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 19 Dec 2016 09:09:37 -0000


>> +    def test_exclude_path(self):
>> +        """Test --exclude-path wks option."""
>> +
>> +        # For using 'e2ls'.
>> +        old_path = os.environ['PATH']
>> +        os.environ['PATH'] = get_bb_var('PATH', 'core-image-minimal')
>> +
>> +        wks_file = 'temp.wks'
>> +        ks = open(wks_file, 'w')
> 
> I'd use more pythonic 'with open(wks_file, 'w') as wks:' here.

Done for all three blocks!

-- 
Kristian

