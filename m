Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D845782FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 18:18:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9KIIaN6022614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 11:18:36 -0700
Received: from [128.224.20.89] (128.224.20.89) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 20 Oct 2017 11:18:35 -0700
From: Konrad Scherer <Konrad.Scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <c9dc44be-45fc-71b7-c488-d7b02e8beebf@windriver.com>
Date: Fri, 20 Oct 2017 14:18:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
X-Originating-IP: [128.224.20.89]
Subject: Wind River Continuous Integration project
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
X-List-Received-Date: Fri, 20 Oct 2017 18:18:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


One of the common challenges of Yocto development is the setup and 
maintenance of a build cluster. If only there was a generic open source 
Yocto continuous integration project to make the setup and maintenance 
of build clusters easy...

I have a working prototype and it's on GitHub.

https://github.com/WindRiver-OpenSourceLabs/ci-scripts

It is a set of scripts and docker images for building Yocto images using 
Jenkins and Docker. There are three main features that I think you will 
find interesting:

1) Multi-host builds using Docker Swarm. This provides an easy way to
scale the build cluster from one to tens of machines. Docker Swarm makes 
this surprisingly simple.

2) Developer builds. This enables build testing of patches before they
are committed to the main branches. It leverages the WR setup[1]
program and a temporary layerindex to assemble a custom project that
matches the developer's local project.

3) Toaster integration. A simple UI to dynamically expose the Toaster
interface of all in progress builds.

We are deploying this internally at Wind River and I hope that the 
oe-core community will be interested in collaborating on its development.

Please have a look and give it a try. All feedback welcome!

[1]: https://github.com/Wind-River/wr-lx-setup

-- 
Konrad Scherer, MTS, Linux Products Group, Wind River

