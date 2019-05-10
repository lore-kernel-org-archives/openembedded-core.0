Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 766047D3F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 19:56:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d21so3311772plr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 12:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hZTiQgum1TCBrFufU5yk3em+aQxdA9rOPZm1LMIM+hY=;
	b=d9ipaztFHWR4dxpSJr8Fd7E6t5GfnJp7PKOpxotdSWss+IwAOZzJLEQFDbzG2kp4NK
	G+yx+r6ZNxe9vuIaMR0lGuUVijecdZbxI7wE9EiOW4YXN7JmvBYqdzRllVT/OsqxgNsZ
	1aps/anM6mOMVS4+nI97ObtVpy+BPPOWnltrUjinvWhhJSfQqTEB3hHZfAX4FICcwUHM
	aWmE9VwVR6oIzzbxcLjuzhT+/s9a5UY92YM51a5p+5hplXbueG1VPmIYZIaLZjgJuzy6
	LH66sd4fwxq3YOGLhRx9uoGP33l9iDEy3vT8AkIG8j6G2Igvo7h0XuAtdZXbyt2F3dD3
	ifzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=hZTiQgum1TCBrFufU5yk3em+aQxdA9rOPZm1LMIM+hY=;
	b=f7PgLJsvMQVOh344WBun1Ry1i3qXo51IEFTbyk03Tt8ZDBcG24JbBWVHu+P1QLBSnX
	jjuUsyizsT9Y5sobIf2qZKDVTCMdL7x90FstQI4f8ORhiRzPzf53Jkegu4BQq7RXKM+I
	JzZYMJwggeKxwHMENwtpWfOQtDlPWL20kV+734My1/8ja8bu/CKMfHkDWljb6OWR9wd/
	XOTF2S3LfZ31wYcx++kRERAL95BS4sXBCjkiOLAyvL9Uzm/OJsFNzYi8PS2tsjok9iVs
	AEiKph5oPGa5tHZn5xNnliXAGNHknd/DPTRRuFU138hk3y5nT+afvJ84THWUkPPi8Sp7
	c/iQ==
X-Gm-Message-State: APjAAAXC6Ls2f+zwK3nTu0TcWPnEPquZ98RCFzqBicyH0bFsZgFn2mB3
	qiGIMervfDzI0J87TNZDIalN1nWmOpE=
X-Google-Smtp-Source: APXvYqw2xV1YXVcmyfdRDyLXm3inRLXaWIV1w+uCntvOkXL2LkcGrbRbLXIDRkHqyztZORyoFO0k3Q==
X-Received: by 2002:a17:902:2847:: with SMTP id
	e65mr15454083plb.319.1557518200889; 
	Fri, 10 May 2019 12:56:40 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	t65sm15106447pfa.175.2019.05.10.12.56.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 12:56:40 -0700 (PDT)
To: Rob Walton <Rob.Walton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <AM6PR08MB3685C976E13C7FEE91C8529C95350@AM6PR08MB3685.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5bc3fff6-1a03-4571-0c90-7746eff7148b@gmail.com>
Date: Fri, 10 May 2019 12:56:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB3685C976E13C7FEE91C8529C95350@AM6PR08MB3685.eurprd08.prod.outlook.com>
Subject: Re: automated license reporting
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
X-List-Received-Date: Fri, 10 May 2019 19:56:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/3/19 4:14 AM, Rob Walton wrote:
> Hi,
> 
> 
> We're working with OpenEmbedded/yocto in a project; we're trying to 
> create an HTML license report for our users, leveraging the 
> license.manifest files output from license_image.bbclass.
> 
> 
> However some relatively crucial information relevant to the report isn't 
> provided in the manifests. The extra information I'm interested in is 
> the contents of the HOMEPAGE and SUMMARY variables for each package/blob 
> recorded by the manifest.
> 
> 
> I'm proposing to submit a patch to add the following to 
> `write_license_files`:
> 
> 
> -                license_file.write("LICENSE: %s\n\n" % 
> pkg_dic[pkg]["LICENSE"])
> -
> +                license_file.write("LICENSE: %s\n" % 
> pkg_dic[pkg]["LICENSE"])
> +                license_file.write("SUMMARY: %s\n" % 
> pkg_dic[pkg].get("SUMMARY", ""))
> +                license_file.write("HOMEPAGE: %s\n\n" % 
> pkg_dic[pkg].get("HOMEPAGE", ""))
> 
> At the moment it isn't a problem for us if this extra information is 
> missing for /some/ packages, as long as it is included at least once per 
> recipe (which is the case).
> 
> 
> The above patch would rely on another patch to add extra output in 
> package.bbclass::emit_pkg_data
> 
> 
> +        write_if_exists(sf, pkg, 'HOMEPAGE')
> 
> We also have a bbclass to convert the license.manifest(s) to JSON format 
> for easier machine readability, so we can automate this process in our 
> build system. This bbclass is also potentially upstreamable.

Please propose it for review.

> 
> My questions are: Would members of the community object to these 
> patches? Are there any other suggestions for grabbing this extra info 
> without submitting the patches? Would anyone else in the community find 
> this useful?

These are probably fine, as there is no standard manifest requirements 
around what this proposal is achieving, but having it covered via a knob
(variable) and turned off by default is probably fine. Eventually if it
is deemed useful we can make it default, this is to consider the fact 
that people might have their own post processing tools which are built 
around current format of the manifest file.

> 
> 
> Thanks,
> 
> 
> Rob
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are 
> confidential and may also be privileged. If you are not the intended 
> recipient, please notify the sender immediately and do not disclose the 
> contents to any other person, use it for any purpose, or store or copy 
> the information in any medium. Thank you.
> 

