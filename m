Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 869 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Mar 2018 08:39:24 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.14])
	by mail.openembedded.org (Postfix) with ESMTP id B6B286093B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:39:24 +0000 (UTC)
Received: from [216.82.249.131] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-14.bemta-12.messagelabs.com id A7/2D-10394-8515BBA5;
	Wed, 28 Mar 2018 08:24:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsXi5LtOQDcicHe
	UwbsfnBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bND59YC36wVDxfvImxgbGVpYuRi0NIYBWj
	xJL/j4EcTiBnMaPEgdaiLkYODmGBRImO61UgYRGBKImbu56xQ9RvZ5SYN/MOK0iCTUBPYvKlJ
	8wgNq+AtcSMqyfB5rAIqEr8+LySDcQWFQiXWHB1CxtEjaDEyZlPwGo4BQwkZh5dxw5iMwtYSM
	ycf54RwhaXuPVkPhOELS/RvHU2M8RtKhIHl14Gq5EAim/afJZ9AqPALCRjZyEZNQvJqFlIRi1
	gZFnFqFGcWlSWWqRrbK6XVJSZnlGSm5iZo2toaKSXm1pcnJiempOYVKyXnJ+7iREYtvUMDIw7
	GJ/sjz7EKMnBpCTKK/t2V5QQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6JAbujhASLUtNTK9Iyc
	4ARBJOW4OBREuF9CpLmLS5IzC3OTIdInWI05mhb+aSNmePGi9dtzEIsefl5qVLivCdASgVASj
	NK8+AGwSL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXiOQKTyZeSVw+14BncIEdMq2ph0
	gp5QkIqSkGhj7NoqrPzxewCHA1jNdtWimqeh+7QP79G9PSc7bXzhvw4W5f+V3FnfmHll9zF9Q
	TPjB29qQG4111u9575y5P7PEMbKuQ5555adEp4lTbXaK2OiuN+lOmi/5TLHDlMEw/nvKf2W9a
	LFvdyabrjkqOG/6sYvT2d73bT8l87L3UesM7uPzNxsoCJkqsRRnJBpqMRcVJwIA1c0JU+cCAA
	A=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-13.tower-28.messagelabs.com!1522225492!64604827!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.9.15; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20799 invoked from network); 28 Mar 2018 08:24:53 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-13.tower-28.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 28 Mar 2018 08:24:53 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 28 Mar 2018 03:24:51 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 28 Mar 2018 10:24:49 +0200
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
	<20151215140434.75233de0@centos-7> <20170508102903.GA9571@mcrowe.com>
	<20170514090737.GA29032@mcrowe.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <8caf7fd5-75a6-b686-9b74-084e56c224ad@digi.com>
Date: Wed, 28 Mar 2018 10:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20170514090737.GA29032@mcrowe.com>
X-Originating-IP: [10.101.2.54]
Subject: Re: [PATCH RFC] module.bbclass: Fix potential do_compile/do_make_scripts race condition
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
X-List-Received-Date: Wed, 28 Mar 2018 08:39:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14/05/17 11:07, Mike Crowe wrote:
> 
> On Monday 08 May 2017 at 11:29:03 +0100, Mike Crowe wrote:
>> We've started seeing the same symptom, but with a v3.14 kernel. We have
>> several recipes that build out-of-tree modules and I can see
>> do_make_scripts for one running at the same time as do_compile for the one
>> that fails.
>>

Even though I have not seen this running manually, our buildservers have 
reproduced it using Rocko and a v4.9 kernel, building the external 
imx-gpu kernel module for a NXP IMX6 based hardware.

So yeah, still happening.

-- 
Javier Viguera
Software Engineer

Digi International® Spain S.A.U.

