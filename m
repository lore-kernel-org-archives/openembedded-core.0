Return-Path: <tasskjapp@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 706B56A9A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 12:59:03 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ea20so3273190lab.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fP5xvacOxMooWVubme8yiMQ0lHA4iTnhUWkJFWQtlAY=;
	b=uylmTas8rmwiXWz0TDOSB08ACkHKz2MY5PJywKVl+lo8UOW2VDG4/9CfR7EEcKysEn
	FpOlxiFHU2IQCYHJKwuxIxl2Z5vl9ilqAiEGSMrPNU1GZSq4ITqfvzoJ/hbXjNPtSYNB
	fmLNW5lrgTk8S6/Ufe9Kk57YMwb9CBRmyKsrhwD9kcHiX02bfZ8L0rDF5hn4Bs6Z9qmo
	wHmnIyI+AUGb31bMGF+x9XRj5YuB/GFn6HkYiTReSJHf54PXpUkE0SdXxF4HZAMakwyb
	NXC8SuWYkl7xmpF8HOUYmghbTv5URHlFqVHrA25y0NGOp7lJ5H77BJd7YWvLbbEtrV12
	1ICQ==
X-Received: by 10.152.8.37 with SMTP id o5mr7228115laa.87.1370955542724;
	Tue, 11 Jun 2013 05:59:02 -0700 (PDT)
Received: from [192.168.0.209] ([77.40.182.98])
	by mx.google.com with ESMTPSA id z9sm6256190lae.7.2013.06.11.05.59.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 05:59:01 -0700 (PDT)
Message-ID: <51B71F13.9070303@gmail.com>
Date: Tue, 11 Jun 2013 14:58:59 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <51B6EF5E.1020404@gmail.com> <20130611124350.GD7181@lpalcu-linux>
In-Reply-To: <20130611124350.GD7181@lpalcu-linux>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK relocation issues
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
X-List-Received-Date: Tue, 11 Jun 2013 12:59:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurentiu.

I just saw your mail, but won't have time to investigate until tomorrow. 
Just wanted to add one comment.

>
>   * denzil did not support relocation and you could only install the sdk in /usr/local;

In denzil I extracted the SDK to 
/home/tasslehoff/src/oe/toolchains/oecore-i686, and created a symlink 
there from /usr/local/oecore-i686. That worked well, and other devs just 
created the similar symlinks to where they had checked out their source 
tree. That is what I'm trying to do now as well.

Will read your mail again and investigate more tomorrow,

Regards,
Tasslehoff


