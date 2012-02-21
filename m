Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RzxTd-00019O-7i
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:42:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1LLY4Zi004552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:34:04 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Feb 2012 13:34:03 -0800
Message-ID: <4F440DCA.9020805@windriver.com>
Date: Tue, 21 Feb 2012 15:34:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1329456260.git.yi.zhao@windriver.com>
	<ea7342b8cdd7a0f9c49253f9e063ab7577f04038.1329456260.git.yi.zhao@windriver.com>
	<4F43F9EE.5080608@linux.intel.com>
	<CAMKF1so0r+8CUMCAQ0Jz1wbP=jSjqnZGuSjPawn5FtJGOQjBjA@mail.gmail.com>
In-Reply-To: <CAMKF1so0r+8CUMCAQ0Jz1wbP=jSjqnZGuSjPawn5FtJGOQjBjA@mail.gmail.com>
Subject: Re: [PATCH 1/3] lsbtest: Add recipe for LSB tests and automate test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 21:42:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/12 3:02 PM, Khem Raj wrote:
> On Tue, Feb 21, 2012 at 12:09 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> I think you need to have a RDEPENDS on at a minimum for this lsbtest recipe
>> since it relies on RPM to install the packages.
>>
>> RDEPENDS = "rpm"
>>
>>
>
> that wont fly if someone is using opkg or dpkg

Unfortunately rpm is a requirement of the LSB test suite itself.  (This is a 
workstation/server oriented test suite, so the requirement is reasonable. 
Nobody should be deploying a system w/ the test suite installed.)

--Mark

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



