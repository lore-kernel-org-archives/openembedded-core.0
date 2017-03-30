Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0068.outbound.protection.outlook.com [104.47.32.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2A071BF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 23:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sYN3qMma6oImbmt5gkB6SJPNlxIQAdjzblbZMImc3TM=;
	b=UaIZeAqu1A09Itq8xRlrar4HK4DWZkRV/2mW+jC3SZP/OWxVZdOjxSgRW+gK1FkK0n81/x7kCnQOaE1Q+ui2vU6FYhoBOK37kGJ437KHXO9NfXrfRAjuOoJA3lKlcQ9rWRKyvUJzqRW9OAsHll0cVQMMypn1w0sPIHhnV4wmEB0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BY1PR01MB1401.prod.exchangelabs.com (10.162.211.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Thu, 30 Mar 2017 23:53:34 +0000
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
	<04df66a4-7305-12f9-8398-66bb2a09a796@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <3b7a87b8-05ac-12d0-5e83-95aed03d7dcd@xevo.com>
Date: Thu, 30 Mar 2017 16:58:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <04df66a4-7305-12f9-8398-66bb2a09a796@gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR09CA0087.namprd09.prod.outlook.com (10.172.133.153) To
	BY1PR01MB1401.prod.exchangelabs.com (10.162.211.150)
X-MS-Office365-Filtering-Correlation-Id: bac2e5ac-4df5-4a49-0e7f-08d477c7fa0f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BY1PR01MB1401; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1401;
	3:sMnXEsWIdZWziPbxMPQ3GPjRwu3MOBnM/c5xkYXeJrD/ADfpdM3slryv6/kexGCRSdxde+ugyz9lcUthu87bZX9j2gqW9EjemfvODk+NCMNO+bAA72pOfZGOH2aepmH0P3hSBhacLx+NX+CWnK3lpl/5xAkmfTMQLxrlKkVnfqX3UT+oW2KmDUKUSxNNH1Zu4PEcKFyRyFrJfDQHkIr95BcEhu8FDhgT1sji0B225HmwrFbjBg0msqyDmdwEjArfGEld1uDXttZ1Ifz3zPj96a/qdkr5zPgmarF1RK40spCOy4iHNQAtdWa6zues6ZJfN4kt0IzyvMAzZYtL8nK21A==;
	25:rE5ikNZS6cgjxG/gP1nVzOgcGmPDnlHDXUaCVckAPgck8HLCRakJ9yvM+36hDMwy9bmC+b2lMhcjXDOdaNFBQ9L8nR1JkDI7t2Ed27B2xtL03hsJreD8ui4nHGvibPQU7nEKdO0KGt/0/82ucEpL3lcW7NrdOqzLIbF7rRVOZPXDCab306R4LX5fv9cJZm33poQUk+xuymLitI41RxzPw7XoTkr5nv9w6vsxDk+CKHInqq2Elwoz2P1C/XtHw60FpYgEYUGCUPR4/xtjdCSaFVI9R37NRnO/GS/Tt9hEGQlwPUMDr9hQMHZoDSQcn4JdFOQGHNP39xP3OtJwPalm4bYM1VKfr0vz0F6jsW4mLZmIzOY5zXa38SDH1rljECC9DWpzIi48KzU+ySEdQeoZjXarof1tiffxO3kMD0fyJaK+9YF3yLQYRBepQZnhRvZ5vyaS7Ynq9nuoyAHbEdxLXw==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1401;
	31:usWJgk6LhCn9xEjVIVd4//8PQoNu34c8dnn86gbi+/yiT1xBafSWxjspZAYbw1xXwdH6hIepe86M3w4HMxCr4zKmovl7calsrjXQyp7LpEWkiC44LW9cQV7AMXAQejgk9Jg1Z6be+OunyDlnIMONYimb179XU23/kHTLk4yzfQ3lETDTsTzVBPmNnwSgxvqXLS/Qm7VeEJzhI0lN5HcbqFgMcIUtuwn41aus2hBoptbSnIRlnfofO/xYieTyu23HZZRUwLFWVtK+j0sAKRukCw==;
	20:SNsKS16wbLsHG4aQZHLKOfD0dxGR6rDgSWXjLy4bYCekDX6tODPJhz/u+HZM024hYQqXSanjrdgZJMGs3d1DD/QWhxnchUD2sWuz6nf8knYkmjp87I0NTnrVbe6tSqLFqqCbSYp6DB3SfcX2jRoWWyeQnpAYpM77A372jx4pBMlZVJTuPbZWf2pfG7eHOU9k8bCflJ4SKqnij2fFxlznXSPRh8rzhFOaxrSxK9VD9e6sSKDrjqaqunlHnIIdluuvscQKiGQbqrjcsUMwUY0992QxACwxm705OjPSdn93qhDLuIx9J3ARd6HI5+c7Nsw0BniVv6BNWsT23fXXRfazCA==
X-Microsoft-Antispam-PRVS: <BY1PR01MB14013652FC03D11324689F9EAB340@BY1PR01MB1401.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(20161123562025)(20161123555025)(20161123564025)(6072148);
	SRVR:BY1PR01MB1401; BCL:0; PCL:0; RULEID:; SRVR:BY1PR01MB1401; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1401;
	4:Hpp1GmzKzu9m3aI0qAW9ZHGTjKEMjQX7ogwPWPZi1VuRBRxsI2XhPm0eJUd0c0fbztea7EBgUlX3tzpfyYQqJhNKc9GWYs9Nxtu/uNDJ9aXDnA+taxO6R/HUWcLdweW7P8OiDegpP/IK9/r9dsUzk4f9XqB63BirK8zFCyvnqTEUOIK/rpfTsvpYa5ZAfTLefldUcsvYsiREP//t/HwnJ39co8wg9jQxiZojOqoqnTocqmFbLIBcYesEZ1GeynryQOSyUgz6Eh80dLZ9foUNNjmFreB8UZRQRR/xpktnk8gyo3W9eqGk6wH8cG6V5z8M8E7rMh8WWY9MOaCsAF8HyNBg9bQOLSlGD4aPOIbbOkn1Ey6nnoFGGDig02kHJxK1ZU1Xv1McYLSce3HqWOtCtImmISfCtbfkCdSvTesaq0ZeNX5rLoq3TMUfaHq6FJoWbGHu411coCL4LtpJQxF7w+sqp/x0ejj+Nf2FBNmVbQAJiKagRfcEEpRrqL1DgPxalP3zI/Nxb0m3p3zL6QLG9V/Kh7PECR7py4XMgwo9wZlM53P7tmKnS+HyeVfw1TrcdriBEDEsRHes7O0TL7oqj6S1UtG3BvOHUN6A6t4dAi2Wa8j528S+5vYCRMyVD5Gf2h0OkLIm6VMWIZmyQdXi/nHcBM5uZU5jOpZ9t7/Z1lI=
X-Forefront-PRVS: 02622CEF0A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(979002)(6049001)(6009001)(39830400002)(39450400003)(39400400002)(39410400002)(51444003)(24454002)(377454003)(76114002)(54356999)(64126003)(6246003)(47776003)(53546009)(25786009)(53936002)(305945005)(76176999)(23676002)(81166006)(229853002)(6486002)(8676002)(7736002)(77096006)(90366009)(38730400002)(5660300001)(33646002)(2950100002)(50986999)(66066001)(83506001)(50466002)(2906002)(31696002)(6116002)(230700001)(6666003)(3846002)(36756003)(86362001)(31686004)(42186005)(4001350100001)(189998001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR01MB1401; H:[10.0.1.79];
	FPR:; SPF:None; MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAxTUIxNDAxOzIzOkxYU0R2VDdDc0pnZnkrWnJ6QWR5V08wYUQy?=
	=?utf-8?B?SmtOU1JZNkhSUWZmQWZPeElXd2VoV29QL2Vab3R4UU05b2FjbHZOM2QvMy9L?=
	=?utf-8?B?WUVBMFI5Q0cxdDVUZnVWUUZHZlB3NE1ja2RoTTMxMEU5Q28rcCtzaXZOTnAz?=
	=?utf-8?B?Y3VPaStWZHhleWdJQUxubkRScHhVNFJKeDRGUURrQUdESmhacG4wQU80UFpk?=
	=?utf-8?B?RjZWWitNSmt4ZUJHSmxvSGpCbUVZMGpTZnpnSVRXREtJOExQaDBaSU50VmIy?=
	=?utf-8?B?YTlSbWVVdGFaWXBmTzdrWXlIQmN5VXVaSTUrOWVzempJTnNvZ1hkRTY0RHlZ?=
	=?utf-8?B?NzVJblhlOHU0ZnorWDJpNG1CZXRvZXBVTXdKMGdzdFBWU25ZZVRMK1NvVnVO?=
	=?utf-8?B?V1VxakRsWlR0bG5QMUE4OGJCWXp4MW0yeHZXWUtpZEE4QWNad1dNU0pxY3Ru?=
	=?utf-8?B?bGlXWitZS3JsWFdxdEJsYmttQ0V2UzllMEhQU1RHYW9JV2pYVkRSbFBuWVhp?=
	=?utf-8?B?bTZ4ZW1wVEk3d3hGOWxzcmFQRzRKSDdrRkpNbWN2K2JCN094aHBUb3Npblk3?=
	=?utf-8?B?UFM4cG9sWTJnSEpEamdxN0hpWmlTZ2ZneHhwQXRDaFVFZWJsQXVYRmdGR25z?=
	=?utf-8?B?TEpjWDFPbHRXcWZjMEVwdU96dGI5am9tUWlBenlaT1RIM0xodmlNKzZDaG9z?=
	=?utf-8?B?aHIyZWNmYVlBUnhyWnQyQ2UzeExZTU1qaTNubmJoYkNTN2hzOWVBY2NqdEJH?=
	=?utf-8?B?NmRyaHI5RS9MSTVTTTEyeklDSll3UzdYQjZBSjhabVhiVXB1S0pVQjJTYnd0?=
	=?utf-8?B?SHowTld1bzFjcFJ5SUFIeVlKMk5KT29PTGdOVGcxYThOTkxrUVZWVVNWTzN4?=
	=?utf-8?B?OVlPUmxPcmFPdkZVQTNLdEdpRnllRFBBODBOSWhnS0VWMEdIVDZ1amdhYzlm?=
	=?utf-8?B?U3IzQ21EamVLclhXWEo3eEoxMVBkdkxxeGZwZEhta1VlTFRzZEVma2FlTndt?=
	=?utf-8?B?STNnL0xnL0hoTXNkM1hYZ3dDNnNvcXd3TEdVRUZVdzdpMVduWk91THhUZ3FB?=
	=?utf-8?B?Y1A5bmYwRkMrTjJUODZEeTFpK2dxaDFIWk5zZkhjZUNVSFQ5TExGNWpldk9y?=
	=?utf-8?B?QkxuS0hmNGxjaG5BcnNNWmtqTERqWk5jNWxHVnR6Yy9JcEZHVGxUVnB4QkVM?=
	=?utf-8?B?bHRzby9GbTZleTJsRHVtbkxIMFRRemN3ZWF4djl6NnFUMzlRSjZrR0R2OVNv?=
	=?utf-8?B?L1RENFdkd3UrOHZLazlPVkEvc0dENENramh1eWkrT240NzF4TUtXZEQ4bGlj?=
	=?utf-8?B?VmNIR1dqbVgxYnltMWpNekhLUVI4cGRKQmVzaTI1YjhhMjd2dTJNcnJkL3BP?=
	=?utf-8?B?ZmhUdS8zTHVqdkE3TlAyYkZqZG5Ob0dOaFJrMm02MGxSTlZvaTM2cEdRNGxS?=
	=?utf-8?B?VE1BVWNQKzJIS0FwVXF1b1JjaVBmN2pFUktiOVc1UXNSbllZK1d3cGFEZzZY?=
	=?utf-8?B?RFBsRCtMRStKQUVUc0t3c2Yyb3ozdHdWMzVSZUsvK1ZjOXJCVWFRT25GUEtV?=
	=?utf-8?B?d1lEaGtSeFZGQlI1bGhTejcvdjBxNXlZS2tJU0d1QjM2Q095VVhJaThMVk1N?=
	=?utf-8?B?dFFRNU40c3JZMTNqb0JaZTJONXZFODhmakczeVZNblNxTjVoUWNuWUhjMnhy?=
	=?utf-8?B?VWxxenYxU0hpNGVqdjZvQ0p4eXhNcWNBRXEwWjZjRTJZU0xTNXFKMkp2ckFl?=
	=?utf-8?B?endxRUxER2UwM0tEVEdmdz09?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1401;
	6:JIGgL0vxu7EyzrmJM+B0+m3OduLlqRsxtGNM2WSL5IgalMw/UtLj/gUMg4n+z4oaOMKTkgEiQblfRHsHEYhuYFbrRkGAP2sZF2JBCH0U1rXzqvNqbSXu5uVfzcy+iMOXrpl7w1e1+05IV27dGwfbzJWsfzdn9kgXCROAoRKZu8bsc/ZhOaEg3ui3kd0RhwrKDCcLHq5hm6H39WWdCaIBDeSUpi+C9LnKrOSZj9PUpzWiW6QxTDlb7bK402uYDpaVPRLWxl2WofFxcwhUuKT8kGc+sdiD5Zqr/7fVK4nmsvegoNoL3WvMbn0e0PaMQpYLYbLU2G44Cn+aRUF5hrBP/U7HrFdQ2NgYYat1lvCK3rsapqbSE8lHlzX6yWCXiDSE0ox/5yqKjIylEIVPNBNIZA==;
	5:J44KBzJwIf0Ga3KrFlerWUSj/977eIB4K7gqQiytMgvhzXlTfycbicTIsDEk+s4tAQiqSbYRr/7pol2ovCCwYlH5r/KT/u63go3EjCPu0MwdcOnFXuGL1bP+3XDEQN3lvihs1zrsseX28WZTtaSeJA==;
	24:VTuDANcA8Ylko39pZC5V1XFMtioaiwk03pqcY23SCb2XTXd8UWamQm3ymOSM/JTQsuj2QaWvQSt5xRxTQRr+Y8gpC3IfESAoxh1a+QQUqPI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1401;
	7:KUVVh/WlFvXRU4+HTB+E3qd0k9o6uuym2X54BJaTidqol1cs37yuhjxyWa4C454k7l99NmZlWlc3DoPuuxQ1ZTw10UvOk/2tMS4tD2/xzccEgZQZaKpOoodWtafbYsAtTcOIK7dUsvVDZZBUWfqOmIORgksuhKqX2MChzTKnGU3DLXaKKVQh423OyScwDUcFKr2pvP40Ok2U1IjznEFPmYV4n18CdQ/Nr6cQ/ny1NL+InoP0UD7FVozT3mCrFwJy3sh5Mm6ywh+GmfefnXGYIYeedAIJt4ogv0bfOBI7BReA9soE09dFVs1PppTWM/6/xhazXTlYaqpwWw62DL49tg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2017 23:53:34.1198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB1401
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
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
X-List-Received-Date: Thu, 30 Mar 2017 23:53:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2017 12:31 PM, Khem Raj wrote:
>
>
> On 3/30/17 12:20 PM, Martin Kelly wrote:
>> Hi,
>>
>> I'm trying to integrate the meta-clang version of LLVM 4.0 (used for
>> recipes that need a newer LLVM version) alongside the oe-core version of
>> LLVM 3.3 (used for mesa). I'd like some recipes to use LLVM 4.0 and some
>> to use LLVM 3.3 and for them not to collide with each other.
>>
>> Right now, once the meta-clang layer is enabled, the recipes collide
>> because they both provide llvm-common.bb. I tried explicitly versioning
>> llvm-common, which makes them no longer collide. However, mesa then
>> fails to build because the meta-clang version of LLVM installs
>> llvm-config into the native common sysroot in
>
> merging all llvm-common into a single recipe might be good

I agree that this would be a good idea. However, at this point the two 
llvm-configs have diverged and return very different sets of flags, so 
they are basically incompatible. Specifically, the oe-core version of 
LLVM returns a set of flags that are not the same as the native 
CPPFLAGS, CFLAGS, etc, while the meta-clang version of llvm-config 
returns a set of flags that are the exact same as CPPFLAGS, CFLAGS, etc. 
See below for the full flag settings in both versions.

Clearly, using CPPFLAGS, CFLAGS, etc. directly breaks cross-compilation. 
For this reason, I added wrapper logic to return TARGET_CPPFLAGS, 
TARGET_CFLAGS, etc. in the meta-clang script, which allowed it to 
properly cross-compile. However, this wrapper logic, and the set of 
flags that the meta-clang llvm-config returns, is incompatible with what 
mesa expects when it calls llvm-config.

AFAICT, this difference in flags boils down to differences between the 
LLVM autotools-based build and the CMake build. For example, in LLVM 
3.3, the autotools build set LLVM_LDFLAGS like this:

./tools/llvm-config/Makefile:50:	$(Verb) $(ECHO) 
's/@LLVM_LDFLAGS@/$(subst /,\/,$(SUB_LDFLAGS))/' \

and SUB_LDFLAGS is empty:

./tools/llvm-config/Makefile:36:SUB_LDFLAGS :=

As a result, in the autotools-based LLVM 3.3, we get:

#define LLVM_LDFLAGS ""

... while the CMake LLVM 4.0 returns the host LDFLAGS, thus 
necessitating the wrapper logic for proper cross-compilation.

In short, (this is just a guess), it appears that the CMake LLVM build 
doesn't do cross-compilation properly, while the autotools-based build does.

I think that's the problem. Fixing it is harder :). We can always 
version both libraries rather than merging llvm-config, but that's ugly 
and not a great long-term strategy.

Can you think of a cleaner way to do this?

Flags:
-----------------------------------------------------------------------

LLVM 3.3 oe-core BuildVariables.inc, after configure step:

#define LLVM_CPPFLAGS " -DNDEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS 
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS"
#define LLVM_CFLAGS " -DNDEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS 
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -fPIC"
#define LLVM_LDFLAGS ""
#define LLVM_CXXFLAGS " -DNDEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS 
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer 
-fvisibility-inlines-hidden -fno-exceptions -fPIC -Woverloaded-virtual 
-Wcast-qual"
-----------------------------------------------------------------------

LLVM 4.0 meta-clang BuildVariables.inc, after configure step:

-----------------------------------------------------------------------
#define LLVM_CPPFLAGS "  -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS 
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS"
#define LLVM_CFLAGS " 
-isystem[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/include 
-O2 -pipe -fPIC -Wall -W -Wno-unused-parameter -Wwrite-strings 
-Wno-missing-field-initializers -pedantic -Wno-long-long -Wno-comment 
-Werror=date-time -ffunction-sections -fdata-sections -DNDEBUG 
-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS 
-D__STDC_LIMIT_MACROS"
#define LLVM_LDFLAGS " 
-isystem[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/include 
-O2 -pipe -D_GLIBCXX_USE_CXX11_ABI=0 
-L[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib 
-L[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/lib 
-Wl,-rpath-link,[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib 
-Wl,-rpath-link,[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/lib 
-Wl,-rpath,[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib 
-Wl,-rpath,[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/lib -Wl,-O1"
#define LLVM_CXXFLAGS " 
-isystem[snip]/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/include 
-O2 -pipe -D_GLIBCXX_USE_CXX11_ABI=0 -fPIC -fvisibility-inlines-hidden 
-Wall -W -Wno-unused-parameter -Wwrite-strings -Wcast-qual 
-Wno-missing-field-initializers -pedantic -Wno-long-long 
-Wno-maybe-uninitialized -Wdelete-non-virtual-dtor -Wno-comment 
-Werror=date-time -std=c++11 -ffunction-sections -fdata-sections 
-DNDEBUG  -fno-exceptions -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS 
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS"
-----------------------------------------------------------------------

