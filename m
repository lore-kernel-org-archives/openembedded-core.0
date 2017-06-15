Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0080.outbound.protection.outlook.com [104.47.32.80])
	by mail.openembedded.org (Postfix) with ESMTP id C1B07783E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9sBHua0VbDVUFv2lNldEdY6pZEjh38UBfP7zO8c9G1I=;
	b=Ug8V4sNOcAz7U710fWzZPcz8PoA40aGYDXRXzbQtQo7f8ka7kw0rZVLyQjcOef45Aweu8/QdqnnnVCh5F8eMzwnDJVezbI3GUXc4+wLDjIszs+DgSGiG8sMdMWqIpBBtCB7xMe4ORDUBv4UzeWED5vhpk8IlQZaVmMU0CxYQESw=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Thu, 15 Jun 2017 16:17:28 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
Date: Thu, 15 Jun 2017 09:17:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: BN6PR13CA0007.namprd13.prod.outlook.com (10.175.123.17) To
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2929:
X-MS-Office365-Filtering-Correlation-Id: fbdfb33a-d8ef-417a-f7f7-08d4b40a053e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR0101MB2929; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	3:bs0aFOye5LC9eEJ9qGUQTaOVOZxKEq/IWP02VBRep63S5UlYiMZijf3Y8vIfcF8ePxBZ7xjHykxc9n1HYoAhQb4HKCAW5hTrNEPIZNaNdkK3Ax/4suam1Cr7LWAuw9Q2UlO2HwdfdC5y3rfG+aahtd410MqPWbad2zsQSFJsOlEv0AzeWbZFUcmBXzIQwjSxGzOVW+X1hmXOuGQmkHXTozfJwzzY1frKa4FP1tQjfPnCqVOEAlWu/Lcu3HaS1BTE3+dATWXHmGvAGHpAPYa8L4FNgFImzLOhH9SrWhbA5flZJHM5x7dDDzJakavdOEwj0CnzYxGykKUVxvYZMPvK8Q==;
	25:5UAVvmIx3WNha9lmZy2I6shCFpkskYqV5qzrRojlKdGmTHux3MsXmEfqK/yN47h3yUfXPTsAO8pcq2BY+U2+JNLH29MoHEbO4FMOoyvQobpDUYKMV+e3mEAhEVaPSf88EpJlcN+Yj4vz3EaMY039funoCgCfi55X3rB6CPlm1PIL1UxvMs2uPDrLy/6F9yCY7E2Bgh8Ts+ZCPNDYF4UPzYPUCM2/9PEyFqsqwxZFyQu/YExnPUhz1uO58ZZP/zBivnZ63uh8+RSxggHD8IResfObT3ePHJo3DaJul1hX9fLdxLmpT1IwjAXqBoX7CUBrQUxwxXAmLQyvRBKO+WKJkR0v/lNv6E+cPLotwvvCh9AdcQEW6zDM5JikisM73fvxRiU8vfTY9C4iDSBUfZ7CSHvfCOczPL+9E5RabF9Rt4f2ixYzmXcBFDJu3ZsiJzY1/xVRCFhGFwZPNhHtlHQjp25+pEiCYfjA5mqyBGSbZnA=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	31:9eVzd81rYxjqMowTbMQYWhjY56uUip4GlU93GWI6W2bZNHkA0lLmW6v8o2EBU4dxjNevWtHsJPg7DeLSRnd9N3kzVjR6CLk0MSe950Qzg6kDw+a4jt88k4wUZVCOa76+Y6cwnyk7jwvRQiGC1+JqDmSfhHrv6vh1rjFc5VUoLyX2orieYpYtiA5ek0KBPJ+5/4Dn+eVEAdkzlImcabRmRlIuOguOKeR84anhHqBFhxfXN3bBT0ydhibxe90CW3RrVEx3N0BEQDb6ilGgGtDUCg==;
	20:55CoGpGr+gwKNZUJ2lfJl+p0FAZWLD5CwJZlVYtIlOKKlxbnwFZvfskMsI5HGxhZzswaWqWjpUGRNT05MphVxu6aDXrzYgmKoYahE1eDexm0A2jMZR5g82E+9xt1/fysOFLw5bGvI2/SSplsFrsZWI5Q1zIhrJhIBqYAhg2dU5qEqRO/DldTGDdYzE8/ruE3gWYSwr21voLO2MX9Ths2S+fNofIawB1Q0nYWDkWWhtQBTJL3A5SXgSSmk3LxdRVbKqGkeZl+Brf+Zq7nk/lmc/bIv4sa6I0IJXLFOb2UNOJpbsol0bDTGbYlH3teyBT5CO0IQiVCUvCei0zJ2whegw==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB292940EF9472B64D1090F19DABC00@BN6PR0101MB2929.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123560025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2929; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2929; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5Mjk7NDpnYkxLNXdMZUZ4SE9Id3AxOGpBWnMrU3JS?=
	=?utf-8?B?K1NMazc5MEx2MnlkOFNCbmM4eXVzOW9aNG1LRUU4dmZYNTh1dmhXajdOeU9W?=
	=?utf-8?B?a1AraXZSMlMzWGNRU045QVlTME0rT1IxN0FIUjMwOEpNZzRjSDEzbUNkS3p0?=
	=?utf-8?B?ZEJmZTM5TVdxWGhIdkswL3J2ZHFIRjRXMkZIZ3dkaWwvQlgrcGthZG52YXF1?=
	=?utf-8?B?YVhRbzRsSmlBbkhmOGxSSEg3NzlGMDVHRHl6dHhIRlV0L01HVSt0VnJtbWdL?=
	=?utf-8?B?UXpNOEllbjJRLzU4bytiT1QzL2YrcjlwNkpWSEozL0I0UHVNOUtyN2o0YnJC?=
	=?utf-8?B?WFgwcXJIOWFuSEpQOTBOK3NrZ0ZxY2V1RTF4SkJmR0daMlA0Y2Rwc2hablVZ?=
	=?utf-8?B?bUJSRTVCQnJGNHJLZXhzOVd0UXRZODd5ck0zc0hacE11eHdxOFhxMzZWNHB0?=
	=?utf-8?B?WXlzZ0VKRUJJZFRJTGFpT1Q3RTQ2Nis3alA2WFlyWXRwR3ozTlAyWFZ4RnNQ?=
	=?utf-8?B?Z3pWaEMxQzk4OERWWEYrbUppaHJZOU9YTnk3OUxnUjRZM3dDM1lLbDR4TEt4?=
	=?utf-8?B?anR2K3R2RHQwSHcvYzFzVGV2ZHUxVUprWWxkcmpNc1Q5cEVoYUE3Zzd5THg4?=
	=?utf-8?B?Wlhuait6ZDJNRGdLYWZQVkw2M0ZkS2pPdHJKM29TRUNNU0NIanR6bVFpM2lj?=
	=?utf-8?B?ZEpZbE9oZ2o4MFlkNjI0RHpnN21GQlc3ek9oYnBodjVQZlByd3ZTYnRENFQ4?=
	=?utf-8?B?RjRpN0lUc3RlQzhNNE82NVlpQmZ1UjY0RVUxVTJPUHd6WW5nek14SkZCWStH?=
	=?utf-8?B?alBjNTZCcHBGbUkwaWhPbEU5NDU3RDlBbnJLUU50WnJoS2hPQ1RzSENodDk5?=
	=?utf-8?B?NnpyN2hsWEtuZ3VHS0IxVUs3SnViWHpaT3V3MmNMMGdGNERpTU1ZbHVuNHVx?=
	=?utf-8?B?c2dhTTNZWkFBbDhZalZta3RYbTY1MVJhSmZxWGRpajlNekUvM0FBa3EzT2I1?=
	=?utf-8?B?SUhPMmNvWm1vdDNTbDQ3SFpqd3cwd3RRNnpCREk4emxGQXpPaXI0SlZsTldZ?=
	=?utf-8?B?TjEvQk5tUy9mSFRnMWZxdHJOVHNGbDM0TzgrVUUyd3NjMThaVVpWc1dMeVB2?=
	=?utf-8?B?Q3hlV3N1VmNlb1lHQXpMaU1nSmZRUXNMTEx6Z3NVMkJJNXMzek1WeXZVNjdn?=
	=?utf-8?B?bzlaS2ZOaXhkOFFURGVRUHlCZjJSMC8rZlRUNFNKWWdtWjZseWthZFFXdkx2?=
	=?utf-8?B?RmpKa3c3SkNxQlY1bjBPTTdkcnVSOFpSUEJTbHJMRkpOSXZZcXcvY1NibWdS?=
	=?utf-8?B?d0lvdm14UGlGNEdrOER0NkV6WDl0UXpRYWNjQVh4L1FRR2lVYXJObi9xWWNC?=
	=?utf-8?B?Vy9ncVdHMXBQZW1NZjZqTnd2bmpjWDNBaHpXLzd0WHk3c0J2SG5SZ3dUOWZt?=
	=?utf-8?B?b3d1OUxITlJydjlTcS8yMFV2Wko2ZkZmbnhCMnM5d3RobVh1NnFLZDlxU25x?=
	=?utf-8?Q?GDbuKMvkrWsOhC44O+zS9g2uBigGywbuHT3g3eZX1bDApYN?=
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(39400400002)(39410400002)(39830400002)(377454003)(24454002)(25786009)(33646002)(76176999)(229853002)(50986999)(31686004)(42186005)(36756003)(6916009)(6666003)(2950100002)(230700001)(53546009)(4001350100001)(6116002)(3846002)(117156002)(54356999)(50466002)(189998001)(23676002)(4326008)(478600001)(2906002)(86362001)(66066001)(81166006)(8676002)(31696002)(53936002)(47776003)(6486002)(6246003)(38730400002)(90366009)(5660300001)(110136004)(83506001)(54906002)(77096006)(305945005)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2929; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5Mjk7MjM6VGpweXpPcE51TFIwdCtaa05yQ3dzWFlU?=
	=?utf-8?B?aExaM0lZNzJWT0p6SGYvUjZ6YnRpRm91Mk55Z2gyZFBvL3FqbVlmQWwzNThF?=
	=?utf-8?B?MHNoKy9INUxTMDNaSy9WY2RJaUVUZGRidmFwWGNNS05NSWJrbDRkdFJPblNy?=
	=?utf-8?B?QUpqZGpzY2FqaXd2bnR3MzdVKys1cTZlN3NmM2FYemh1R1daUUo5SSswdGds?=
	=?utf-8?B?cDlWNm5ETC8yTEdteG10d1VWTHZVb21PaW9pZ3RaRHhkYmpPOUFmU1RRUUlJ?=
	=?utf-8?B?VlRRUCs0bmNZT0dzNE1yYUJnejV5U3dwWGRyVE1lcmQ2bVAxbnc0RlVMQVcv?=
	=?utf-8?B?UUVVem9kS0RQZy8zTXk3aUlHM25UK2FMR1FCVjhDcSt1MFlzRCtIWlJMcWZE?=
	=?utf-8?B?QXUzNnF4VWYvcjhYcnIyVWZsTSszZXA2TmNWaW1kMlYyYnd5TE1DN3V2eTQ4?=
	=?utf-8?B?SHF3UHdYM005YXFVZTk0cHV5R0w4SjRhSDQ5WkdBb0gvOHhudkpDRTNqMGdJ?=
	=?utf-8?B?S3pZeFQvSE1tLytjcVdqUUpLVUVSTHpIUmFoWE5VTXRYWi9mTXhic2VRTldn?=
	=?utf-8?B?SE1GUnkrdVNXVDBlWDRlbkt2U1VuMUg0eEpZNGVWRThtUlBWNDJvMXpjT0tS?=
	=?utf-8?B?b0ZObCtKUkZKTU41dkJoUHZsamZBaXVHblhTb3Zrb1FjREJXSEx5aWl4aE1y?=
	=?utf-8?B?eWlJb3B5bVI2RDFid0lOb3VoWmtaWkhReS9leTREQ0pjMlpjNHZvdDVoTk5D?=
	=?utf-8?B?N2tKY1JuenlVc3hSQ0U4K0UwSVBpNk5xRDhrMVZJSzErVmZOOWROWEtVdTZC?=
	=?utf-8?B?OVFlQy9QOXA4SURoUGt6a0FTZE4rRVM5SHE5MThGTGtQNW5kVnRDM002SEdI?=
	=?utf-8?B?YzJ4NnNjRlJjdUwzL2pSOW1mL0Jpc0NMYVo0U2xsTkRkTVF0L0ttNmJmdE93?=
	=?utf-8?B?M20rdDEwV1p6Sm1CUmlPSSt3V0NnTjZxWExBRkNkUzBVTk9KRHNrWjMxVFF1?=
	=?utf-8?B?ZnhKbXFMY0J0VVpxcFpaV0VNOGpJWWNIMzRtdmt1Z0hSdkZGUXdlQmpKR1Bj?=
	=?utf-8?B?WjQxZ0JWN09MUDBGQXlHeWxMWmZRMjE5SS9WTFlRZ1dpMm1RSXE1WEQ5b2tT?=
	=?utf-8?B?WGthTGFLa1dxaGJzOG5FLzBLRU12bjBmSmp6eDhtbkFaejRWeTN5ODB1SDhO?=
	=?utf-8?B?enpody84VzZEbkFWei9MZDRsQ0Z0NXo1UWtFMlZRbmpuWFg1LytrcWQ0QnBF?=
	=?utf-8?B?RUZQMm5iQWN6N2p6bWZQam01NDFlZU42cTl0MHp5K0ZlbDlzNGNqNmdRZzJ0?=
	=?utf-8?B?ODc0STRRcHlGRFBPUHNpU3RyRk45K3Q1UHorN3JaYU90Qy9keEpYMnJHUSsz?=
	=?utf-8?B?S2NWaU53MnBJcXpXd1ZZQmxoVExnWEhxSjFldHp2cnoxWXFjemd4WjFFdXBw?=
	=?utf-8?B?anBsNUxjdkNsTTllaVJuZnh0ZFhjZzJIVU1aUVNYV3dEUWh5UXBEcWlOa3ZF?=
	=?utf-8?B?SzRXVTJlUzVlSjJsMmd6NW1NTTBIRnM3SzFRbEJMZDlTUmE4L3ZDWkZkM2ZN?=
	=?utf-8?B?dTVMRzlGZTZ5M3JaTlU1aHROczdKNEtVYXd3VmZiNTlMNUpVNXZuU3o3S1ov?=
	=?utf-8?B?dFZIUEtDcE15S0lReG9QaUlaM0RQL3oxOE9QdXFvbW9lZXFUZ2xyN0VNSUZ1?=
	=?utf-8?Q?DcwH1TD29zhv2MGndNd0Kqgwt8Kq/pisbSsuKAUvM?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5Mjk7Njp1d3RHc0hkOWtmQnQxZFJkeDJ4elRoS3hM?=
	=?utf-8?B?SWtSQmc2NWpBTFVGS01NQldoRE9sOGN3MlJOSkRQK3dDSGtyQzgrV1dWbVNz?=
	=?utf-8?B?TmFkcFMybGFGeFEwM0N4dUh5NWt6c2FkbUhxVllwa3lJNG90bll5aGZzZ2pC?=
	=?utf-8?B?aUhqdnV5ekhDNHFIY3NOZzZWNW9Tb0MwT1N0QVhLNUxGSmVkQ3hzTXBvMElW?=
	=?utf-8?B?TGVGNSs2NnltemxlNDM2aGtTM21jSEZLem5LWmhyWVBCcktXV1gyQzBwcTc0?=
	=?utf-8?B?OEw1N2RjZzJYNjIyU1dNTVBaQ29xZEFUWExCUzBnZVNuMCtWN0tITCtZM1c1?=
	=?utf-8?B?SStFNm9TRkpRbkZWN3h6cDYraFJodzJtSk5yYnpOSGx1NjgyaXc1SDR0UlFq?=
	=?utf-8?B?ZE1oTEtiRGdad2loQ2xkeitpMkYxbE5DdVVydnhBdlQ0UmZ4NkFjdEFNQXln?=
	=?utf-8?B?c25LWGJDQ3M3d1dOaVYyMmkxREdyb1hsLzBjM29id1lJV0greVovOG85cnA2?=
	=?utf-8?B?b1VjVzVTNzdEampCZjlwbmhVYnVwZzNINmFkbFdyOU8wb2NReVA0RDBMRkRs?=
	=?utf-8?B?T0JrYTQybkl0WDdNU0RoM1pQUVFZR1ZTYlBkalhZUDJwMUNMTTE5SklPTXFI?=
	=?utf-8?B?NGcrUDZQZFlJbzBsWUtjTm0wWjRlNjFvc2h2emhZZzVZdFMrL0dueEV3Z1By?=
	=?utf-8?B?UDJjM0FoQkNrTGRFTldFa3ZSR2FmRTg4Uk8xVldQUGRrUXdzY2o3VTRhOEph?=
	=?utf-8?B?L1RRakt3QmNCcklXcG1hSWdNRzZQUVROTytNY0l3dmQvOVNoaEJldFc4WE5U?=
	=?utf-8?B?eXJuUTF6a0dXTXRqMTgyc2VlR1JsTTFuT3FWL1pGYm1RdjIwVzd3VlFMa09p?=
	=?utf-8?B?MEtuUlRHZkxVRzV6NEQwZTFZbTFSMXJ2R1haWUJ1Z0ljOHhlRjlVSjdMRkFO?=
	=?utf-8?B?bk1sTFdldE1NWEJuUjFQRXd5RHYxOG1acFkyTGhzS0ZORXgvZFk1MGx3aHMx?=
	=?utf-8?B?VFIvMlRudmx3N2l3by9BOEpnRFF6NExDQytJbDVPUmxWVlpMSnBNUWFucGN2?=
	=?utf-8?B?dTVmNXRNQkQ4UVpCUFZQZFh3cWpBc2dZUC9PcUdqNXptKy9UTlBPQnc2NFVa?=
	=?utf-8?B?d1JlQ3oweFRMSm0wY1hXZkJzVXFXcmNsVDFhK3RpSEhyTkx1dm9jeU9lbWRS?=
	=?utf-8?B?cDB2VjlyMlJ0VnQ4R2pYaHdVbUtMeCtyZ201N3NGRWtxeWQwRGkxbHRPdUYz?=
	=?utf-8?B?MjNTWjljNlhNRnZ2SS9aNmozSTliWW54UXNZTUxYa2xCL0p3N0w0Rlh2T2c5?=
	=?utf-8?Q?HXfCQkXOjqC8B/YkMcIWRfmy6REioN6AM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	5:S+Yzhbzgpi1wnE9qCkgQjw6LrZ8asOG3XQcOrTKvjguM8086U5MMRnbyclaGiKl6Ll5nywLj2eaCpljPyJs7pPRl5JSziBMnbSsLuOXyyeBmt+oVPdDRDwXZgEYjjgTPo7sYhbpQGBSrG9NK9hL3fYkSS3cmqW57DvSeAZmV5VtAlFAHIi+Mcjv1nNUaF0cQKEEmVKuwsiA7WeTVWF1YRMIXtzQFkd7bYEK2F52ADLf4/APHPtjIm0TeYNXS3c8kez92SmSPujqDlfwa5RmDKDEkkth8sa1tcXT3Shs1TK4qtjgd57OPkNJwa+Oa0DVscGN4lpigZQ+IzND+IFGxKkhV4Unzgfqu8FOx1hoqdBThNEYbVjRboTgHKirfe3w/Fiv+DUlHUE4D3Z4BV1agvX1yI1MW3rw0SlrJpbJux3Jfh1+OP9BZm6CncTHi/iTpLoPtTkC68KIQ4FxfBNpzTjBkhwHgpNXvV1UogE/VEmFvihpZM+wSi6ebaRFf1F3k;
	24:MwKmSPS+Lr38oIUkX4qeb00B9NnjAIT5kHhdLKE7Cz/208xYCmIx5MVF1YK2rdwdFAiK1z5EtxJy08tfJD7n50zSL1mi7GejBgaqGbXuH1M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	7:lG3SizWLXhY3ILpNuGF8bA1U7I15zP1V0QDQO/reED3XKbSpVTn2uvKXLeFhTjCDw7PtSLQbeTNyVgSeuOyQm49xzcmF64yVZZRu54t0WAUAG+4wGROz2a55us4p2o4jdZpN3tAShp9F1RxMwimNiyLxKul7PNdKKrcB9W6QARRP6KvBzh5UsQz4rqzDk9oHZqCdHtHlR7PeLDWWFgj+Mf5ecMen4JeY4LsVeloQqx2SwplaQQ+yl2FqgY7rz8odSVvvfiM7UPVSJtl3KijxtPzMqvMDlcTiQY8A+Ln/9Nq1LdZIPGa82vfIkNN3yhaebuVhSIpT9K39luuAdDpHWfw8xGAWx98kcxgcR87lFdFsH8fadrPn0pnR5mYxFN+lpQ76eL2V92hSvOzNrChWbgXSprKcqOYk63U67Yn9GC3wsOdmoVR2UrrDQ76A59qzTI/m3Py0Jk8ZYgcEyMnCksOpZ6g6KPf1gXsr28Sy9qbZCEIWpJTrocXu9g9yPDLbU+3FQ8VlKbEJd0XldQ/vgKjdEmXIIIkkLw3hkI6D6ob1uhmVUyjiko2zDVWJ1P+kCLNfcUNyj9zAHJzskhAn91BV8mVrfNeCRwR5mzCQ3qbCqD/cHmru/ha9U93bDHAvMfq/1eCqEQ6CiPgb45dOAlWHnnQhHVCRLdLENOoYEl9aBAOV7XyUB+P7hBvrje+TG4ysxhg/ervbYnW7dr0lUnHKxHw9lynih/LLmRUdVFrBb/FALd23xSSwo1YGWEmHX/tXZTv7/IqTd5P/4csugpo00bv2ydxMbcHOKiOWg3I=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2017 16:17:28.7705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2929
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Thu, 15 Jun 2017 16:17:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 04:45 AM, Burton, Ross wrote:
>
> On 2 May 2017 at 20:20, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     -QB_CPU_KVM_x86-64 = "-cpu kvm64"
>     +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>
>
> What's the actual meaning of the "kvm64" and "kvm32" CPUs?  Is there a
> performance hit?  Should we be instead changing the qemu machine to
> target a different instruction set?
>

I am no expert, but running qemu -cpu help just says:

kvm32 - "Common 32-bit KVM processor"
kvm64 - "Common 64-bit KVM processor"

My best guess is that, running on qemu without kvm, both cases will be 
slow (since it's all software emulation). But, using qemu -kvm, it 
should be fast as long as you run on a native CPU that is core2duo or 
better, as the native instructions can just be exposed and passed 
through to the host. Since core2duo is very old by now, it should be 
fast for virtually everyone building on x86.

Regardless, the core issue here is not performance but merely making 
sure that binaries run without crashing in the emulated environment. We 
need to upgrade the emulation to match the binaries or downgrade the 
binaries to match the emulation (aka building against something even 
more ancient than core2duo). Further downgrading the CPU seems wrong to 
me because core2duo is already quite old.

