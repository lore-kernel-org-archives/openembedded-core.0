Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5D06676FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 18:45:00 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:8d89:4cad:f4f4:24ea] (192.168.15.34)
	by smtp.enea.com (172.21.1.208) with Microsoft SMTP Server id
	14.3.224.2; Mon, 28 Sep 2015 20:44:58 +0200
To: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
	<CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
	<30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
From: Tudor Florea <tudor.florea@enea.com>
Message-ID: <56098AA9.2070505@enea.com>
Date: Mon, 28 Sep 2015 21:44:57 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
X-Originating-IP: [192.168.15.34]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Mon, 28 Sep 2015 18:45:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 28.09.2015 18:41, Ray, Ian (GE Healthcare) wrote:
> Hi Ross
>
>> On 28 September 2015, Ross Burton wrote:
>>> On 28 September 2015 at 15:46, Ray, Ian (GE Healthcare) <ian.ray@ge.com> wrote:
>>> The main benefit is for packages that are run-ptest /aware/, in which case
>>> the recipe can be simplified.
>> Surely if an upstream is under your control and is ptest-aware, it can also install run-ptest into the right place too?
> The run-ptest script is currently required to be in WORKDIR.
Actually run-ptest is currently required to be present in 
/usr/lib/<package>/ptest. If a package is "ptest-aware", that  package 
should contain a  install-ptest make target which will take care of 
installing the run-ptest file.

>   Can a package
> know WORKDIR without other changes to the recipe?  (WORKDIR did not
> seem to be present in a quick check of a run.do_compile log I had handy.)
>


