Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 216C772491
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 16:33:19 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so26616490wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jun 2015 09:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HgZwANsLRBzl03bhEMWQeqi3X5qomF/J3ME+XmWF+2c=;
	b=mqYtv9zjkt172gjCQr7ULDz3EI8iE5WWqVHtIqpcuydQGXTiQgZdzyHfiVH3RI8SXu
	IYtGyl5FuKp76WJEcadVdcKfecUJ4pYcU11vsQ+ZrD7tzvQ+mdlfx3oqAcOAJxNe1kNY
	jEX8z8fTebeWpbL5Vdy5IjHKfrZOSbk3tMJv465cCN5h35vM2ZWtNaWX/zx8xZWLDYpg
	kPzdnYh8bqxEdAzft7Tad1yKa2cGHuM/2R+RV3u5z+KNgjZndRc4bPIftQC2jgoA2fVt
	KfHxBoYBPiqoJn20nU1I1q713epBw5LG9GdXY2zDRgotOdeHbeWr9FVE6u7x4Qfxq5ls
	F5PQ==
X-Gm-Message-State: ALoCoQnDQtS4CUgfBKidQauTX5ugjmsBfVDWsSOUAG846+wgymhwZRjabmi+Tyxp57jFxYoeNIHP
X-Received: by 10.194.90.171 with SMTP id bx11mr7563474wjb.129.1433522000045; 
	Fri, 05 Jun 2015 09:33:20 -0700 (PDT)
Received: from blackadder-2.local (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id pf4sm6657477wjb.23.2015.06.05.09.33.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jun 2015 09:33:19 -0700 (PDT)
Message-ID: <5571CF48.6060009@intel.com>
Date: Fri, 05 Jun 2015 17:33:12 +0100
From: Ross Burton <ross.burton@intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
	<1433484789-304-4-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1433484789-304-4-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [wic][PATCH 3/4] wic: replaced __run_parted with exec_native_cmd
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
X-List-Received-Date: Fri, 05 Jun 2015 16:33:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2015 07:13, Ed Bartosh wrote:
 > There is no need for yet another wrapper around exec_native_cmd.

This doesn't appear to apply to master, can you rebase?

(or does it depend on your other series?)

Ross

