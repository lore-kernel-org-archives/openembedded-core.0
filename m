Return-Path: <joe.rutledge@phabrix.com>
Received: from ion-systems.net (custmail.ion-systems.net [213.129.94.130])
	by mail.openembedded.org (Postfix) with ESMTP id B44EA60110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 08:35:15 +0000 (UTC)
Received: from [192.168.178.23] ([217.63.252.239]) by ion-systems.net with
	MailEnable ESMTP; Tue, 15 May 2018 09:35:13 +0100
References: <6b04a571-cf20-5f25-8147-d2fe72fdeb90@phabrix.com>
To: openembedded-core@lists.openembedded.org
From: Joe Rutledge <joe.rutledge@phabrix.com>
X-Forwarded-Message-Id: <6b04a571-cf20-5f25-8147-d2fe72fdeb90@phabrix.com>
Message-ID: <3a2ff1bf-fa18-9b6b-83ce-e6d7fdd271bc@phabrix.com>
Date: Tue, 15 May 2018 09:35:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <6b04a571-cf20-5f25-8147-d2fe72fdeb90@phabrix.com>
X-ME-Bayesian: 0.000000
Subject: Krogoth branch Python 3.5 package maintainer
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
X-List-Received-Date: Tue, 15 May 2018 08:35:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

I'm not sure if this is the right address to ask the question to but I 
thought you may be able to help? Apologies for the cross post to 
poky@yoctoproject.org, I've only just found out that that's for more 
general issues.

I have an issue with the Python 3.5 packaging within the Krogoth branch 
of Poky. It doesn't seem to package the _posixsubprocess library needed 
for deployment onto the target, even when the rest of the subprocess 
python files are there. I've fixed this within python-3.5-manifest.inc 
and am looking for the maintainer to see if the patch is valid and if 
they want to include it within the mainline Krogoth branch. Can you 
point me in the right direction?

Many thanks,

Joe

