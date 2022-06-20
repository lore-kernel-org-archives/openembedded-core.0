Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <4b1d26ac-6fe2-50cf-4cbd-23fcee49b0b8@gmail.com>
Date: Mon, 20 Jun 2022 08:39:25 +0530
MIME-Version: 1.0
Subject: Re: [OE-core] [kirkstone 00/26] Patch review
References: <CAOSpxdY7jX0L+eVhQmsATJ0Ui7WY2BO3YLhHPy9A1_xD8WVo7Q@mail.gmail.com>
 <10174.1655345951333043146@lists.openembedded.org>
 <e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com>
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
In-Reply-To: <e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com>
Content-Type: multipart/mixed; boundary="------------dQosiDXkoKRCtPQBLCUi0006"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, "steve@sakoman.com" <steve@sakoman.com>

--------------dQosiDXkoKRCtPQBLCUi0006
Content-Type: multipart/alternative;
 boundary="------------0pqvIRfx1iRkHi01wp2Rj9AL"

--------------0pqvIRfx1iRkHi01wp2Rj9AL
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hello Randy,

On 16-06-2022 19:49, Randy MacLeod wrote:
> On 2022-06-15 22:19, Sundeep KOKKONDA wrote:
>> Hello,
>>
>> GCC regression test performed on /Kirkstone/ with gcc-11.3 & 
>> gcc-11.2. The results are *NOT* identical. Below is test summary.
>>
>> *gcc-11.3:*
>> /                === gcc Summary ===/
>> /# of expected passes            126552/
>> /# of unexpected failures        24295/
>> /# of unexpected successes       77/
>> /# of expected failures          782/
>> /# of unresolved testcases       10/
>> /# of unsupported tests          2760/
>> //home/bft1/skokkonda/kirkstone/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc 
>> version 11.3.0 (GCC)/
>>
>> *gcc-11.2:*
>> /                === gcc Summary ===/
>> /# of expected passes            125933/
>> /# of unexpected failures        24215/
>> /# of unexpected successes       76/
>> /# of expected failures          773/
>> /# of unresolved testcases       10/
>> /# of unsupported tests          2779/
>> //home/bft1/skokkonda/kirkstone-gcc-11.2/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc 
>> version 11.2.0 (GCC)
>>
>>
>> /
>
> /11.3: # of expected passes            126552/
> //11.2: # of expected passes            125933//
>
> So >= 619 additional tests were added and they mostly pass (as you'd 
> expect).
> That's good news.
>
>
> /11.3: # of unexpected failures        24295/
> /11.2: # of unexpected failures        24215/
> /
> /
> /So 80 additional unexpected failures - can you summarize what these 
> failures are?
> /
There are 83 tests failed with GCC-11.3 and out of them most of the 
failed cases (75 tests) are /execution /tests and the remaining are 
/test for excess errors/ (Tests with excess messages output to stderr). 
The Failed tests list is attached.
> /Were any of them fixed after the 11.3 tag?
> /
Does it mean, do you want me to test on 11.4 and compare?
> /
> Are they related to one part of the toolchain or spread across various 
> features?
> Are they reproducible when buiding outside of bitbake?/
The test failures are from gcc.dg/torture, gcc.c-torture & gcc.target 
testsuites.
> /
> /
> /The other differences are less significant.
> If you post similar data in future emails, please do the math for people!
> /
> /
> /
> //
>> gcc-11.3 & gcc-11.2 test summaries are attached.
>
> I didn't look at these yet but  thanks for providing them.
>
> Since we're not seeing any runtime regression in our Yocto
> test suite, I suspect that we shouldn't panic but should instead
> just work to understand, fix, upstream and monitor for future regressions.
>
> ../Randy
>
>>
>>
>> --
>> Thanks,
>> Sundeep K.
>>
>> 
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux


--------------0pqvIRfx1iRkHi01wp2Rj9AL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hello Randy,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 16-06-2022 19:49, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 2022-06-15 22:19, Sundeep KOKKONDA
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:10174.1655345951333043146@lists.openembedded.org">
        Hello,<br>
        <br>
        GCC regression test performed on <em>Kirkstone</em> with
        gcc-11.3 &amp; gcc-11.2. The results are <strong>NOT</strong>
        identical. Below is test summary.<br>
        <br>
        <span style="text-decoration: underline;"><strong>gcc-11.3:</strong></span><br>
        <div><em>                === gcc Summary ===</em></div>
        <div> </div>
        <div><em># of expected passes            126552</em></div>
        <div><em># of unexpected failures        24295</em></div>
        <div><em># of unexpected successes       77</em></div>
        <div><em># of expected failures          782</em></div>
        <div><em># of unresolved testcases       10</em></div>
        <div><em># of unsupported tests          2760</em></div>
        <div><em>/home/bft1/skokkonda/kirkstone/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc 
            version 11.3.0 (GCC)</em></div>
        <br>
        <span style="text-decoration: underline;"><strong>gcc-11.2:</strong></span><br>
        <div><em>                === gcc Summary ===</em></div>
        <div> </div>
        <div><em># of expected passes            125933</em></div>
        <div><em># of unexpected failures        24215</em></div>
        <div><em># of unexpected successes       76</em></div>
        <div><em># of expected failures          773</em></div>
        <div><em># of unresolved testcases       10</em></div>
        <div><em># of unsupported tests          2779</em></div>
        <div><em>/home/bft1/skokkonda/kirkstone-gcc-11.2/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc 
            version 11.2.0 (GCC)<br>
            <br>
            <br>
          </em></div>
      </blockquote>
      <p><em>11.3: # of expected passes            126552</em><br>
        <em><em>11.2: # of expected passes            125933</em></em></p>
      <p>So &gt;= 619 additional tests were added and they mostly pass
        (as you'd expect).<br>
        That's good news.<br>
      </p>
      <p><br>
      </p>
      <div><em>11.3: # of unexpected failures        24295</em><br>
        <div><em>11.2: # of unexpected failures        24215</em></div>
        <div><em><br>
          </em></div>
        <div><em>So 80 additional unexpected failures - can you
            summarize what these failures are?<br>
          </em></div>
      </div>
    </blockquote>
    There are 83 tests failed with GCC-11.3 and out of them most of the
    failed cases (75 tests) are <i>execution </i>tests and the
    remaining are <i>test for excess errors</i> (Tests with excess
    messages output to stderr). The Failed tests list is attached.
    <blockquote type="cite"
      cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
      <div>
        <div><em> Were any of them fixed after the 11.3 tag? <br>
          </em></div>
      </div>
    </blockquote>
    Does it mean, do you want me to test on 11.4 and compare?<br>
    <blockquote type="cite"
      cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
      <div>
        <div><em> <br>
            Are they related to one part of the toolchain or spread
            across various features? <br>
            Are they reproducible when buiding outside of bitbake?</em></div>
      </div>
    </blockquote>
    The test failures are from gcc.dg/torture<span style="color: rgb(0,
      0, 0); font-family: monospace; font-size: medium; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>, <span style="color: rgb(0, 0,
      0); font-family: monospace; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">gcc.c-torture </span>&amp; gcc.target
    testsuites.<br>
    <blockquote type="cite"
      cite="mid:e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com">
      <div>
        <div><em><br>
          </em></div>
        <div><em>The other differences are less significant.<br>
            If you post similar data in future emails, please do the
            math for people! <br>
          </em></div>
        <div><em><br>
          </em></div>
        <em></em></div>
      <blockquote type="cite"
        cite="mid:10174.1655345951333043146@lists.openembedded.org">
        <div>gcc-11.3 &amp; gcc-11.2 test summaries are attached.<br>
        </div>
      </blockquote>
      <p>I didn't look at these yet but  thanks for providing them.</p>
      <p>Since we're not seeing any runtime regression in our Yocto<br>
        test suite, I suspect that we shouldn't panic but should instead<br>
        just work to understand, fix, upstream and monitor for future
        regressions.<br>
      </p>
      <p>../Randy<br>
      </p>
      <blockquote type="cite"
        cite="mid:10174.1655345951333043146@lists.openembedded.org">
        <div><br>
          <br>
          --<br>
          Thanks,<br>
          Sundeep K.</div>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0pqvIRfx1iRkHi01wp2Rj9AL--

--------------dQosiDXkoKRCtPQBLCUi0006
Content-Type: text/plain; charset=UTF-8; name="FailedTests_GCC-11.3"
Content-Disposition: attachment; filename="FailedTests_GCC-11.3"
Content-Transfer-Encoding: base64

RkFJTDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL2JpdGZsZC0xMC5jICAgLU8wICBleGVjdXRpb24g
dGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL2JpdGZsZC0xMC5jICAgLU8xICBleGVj
dXRpb24gdGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL2JpdGZsZC0xMC5jICAgLU8y
ICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL2JpdGZsZC0xMC5j
ICAgLU8zIC1nICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL2Jp
dGZsZC0xMC5jICAgLU9zICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVj
dXRlL2JpdGZsZC0xMC5jICAgLU8yIC1mbHRvIC1mbm8tdXNlLWxpbmtlci1wbHVnaW4gLWZsdG8t
cGFydGl0aW9uPW5vbmUgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuYy10b3J0dXJlL2V4ZWN1
dGUvYml0ZmxkLTEwLmMgICAtTzIgLWZsdG8gLWZ1c2UtbGlua2VyLXBsdWdpbiAtZm5vLWZhdC1s
dG8tb2JqZWN0cyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5jLXRvcnR1cmUvZXhlY3V0ZS9w
cjEwMzA1Mi5jICAgLU8wICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVj
dXRlL3ByMTAzMDUyLmMgICAtTzEgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuYy10b3J0dXJl
L2V4ZWN1dGUvcHIxMDMwNTIuYyAgIC1PMiAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5jLXRv
cnR1cmUvZXhlY3V0ZS9wcjEwMzA1Mi5jICAgLU8zIC1nICBleGVjdXRpb24gdGVzdA0KRkFJTDog
Z2NjLmMtdG9ydHVyZS9leGVjdXRlL3ByMTAzMDUyLmMgICAtT3MgIGV4ZWN1dGlvbiB0ZXN0DQpG
QUlMOiBnY2MuYy10b3J0dXJlL2V4ZWN1dGUvcHIxMDMwNTIuYyAgIC1PMiAtZmx0byAtZm5vLXVz
ZS1saW5rZXItcGx1Z2luIC1mbHRvLXBhcnRpdGlvbj1ub25lICBleGVjdXRpb24gdGVzdA0KRkFJ
TDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL3ByMTAzMDUyLmMgICAtTzIgLWZsdG8gLWZ1c2UtbGlu
a2VyLXBsdWdpbiAtZm5vLWZhdC1sdG8tb2JqZWN0cyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdj
Yy5jLXRvcnR1cmUvZXhlY3V0ZS9wcjEwMzI1NS5jICAgLU8wICBleGVjdXRpb24gdGVzdA0KRkFJ
TDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL3ByMTAzMjU1LmMgICAtTzEgIGV4ZWN1dGlvbiB0ZXN0
DQpGQUlMOiBnY2MuYy10b3J0dXJlL2V4ZWN1dGUvcHIxMDMyNTUuYyAgIC1PMiAgZXhlY3V0aW9u
IHRlc3QNCkZBSUw6IGdjYy5jLXRvcnR1cmUvZXhlY3V0ZS9wcjEwMzI1NS5jICAgLU8zIC1mb21p
dC1mcmFtZS1wb2ludGVyIC1mdW5yb2xsLWxvb3BzIC1mcGVlbC1sb29wcyAtZnRyYWNlciAtZmlu
bGluZS1mdW5jdGlvbnMgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuYy10b3J0dXJlL2V4ZWN1
dGUvcHIxMDMyNTUuYyAgIC1PMyAtZyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5jLXRvcnR1
cmUvZXhlY3V0ZS9wcjEwMzI1NS5jICAgLU9zICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmMt
dG9ydHVyZS9leGVjdXRlL3ByMTAzMjU1LmMgICAtTzIgLWZsdG8gLWZuby11c2UtbGlua2VyLXBs
dWdpbiAtZmx0by1wYXJ0aXRpb249bm9uZSAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5jLXRv
cnR1cmUvZXhlY3V0ZS9wcjEwMzI1NS5jICAgLU8yIC1mbHRvIC1mdXNlLWxpbmtlci1wbHVnaW4g
LWZuby1mYXQtbHRvLW9iamVjdHMgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuYy10b3J0dXJl
L2V4ZWN1dGUvcHIxMDQ4MTQuYyAgIC1PMCAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5jLXRv
cnR1cmUvZXhlY3V0ZS9wcjEwNDgxNC5jICAgLU8xICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2Nj
LmMtdG9ydHVyZS9leGVjdXRlL3ByMTA0ODE0LmMgICAtTzIgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlM
OiBnY2MuYy10b3J0dXJlL2V4ZWN1dGUvcHIxMDQ4MTQuYyAgIC1PMyAtZm9taXQtZnJhbWUtcG9p
bnRlciAtZnVucm9sbC1sb29wcyAtZnBlZWwtbG9vcHMgLWZ0cmFjZXIgLWZpbmxpbmUtZnVuY3Rp
b25zICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmMtdG9ydHVyZS9leGVjdXRlL3ByMTA0ODE0
LmMgICAtTzMgLWcgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuYy10b3J0dXJlL2V4ZWN1dGUv
cHIxMDQ4MTQuYyAgIC1PcyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5jLXRvcnR1cmUvZXhl
Y3V0ZS9wcjEwNDgxNC5jICAgLU8yIC1mbHRvIC1mbm8tdXNlLWxpbmtlci1wbHVnaW4gLWZsdG8t
cGFydGl0aW9uPW5vbmUgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuYy10b3J0dXJlL2V4ZWN1
dGUvcHIxMDQ4MTQuYyAgIC1PMiAtZmx0byAtZnVzZS1saW5rZXItcGx1Z2luIC1mbm8tZmF0LWx0
by1vYmplY3RzICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL2FuYWx5emVyL2RhdGEtbW9k
ZWwtMS5jICAodGVzdCBmb3Igd2FybmluZ3MsIGxpbmUgMjU0KQ0KRkFJTDogZ2NjLmRnL2FuYWx5
emVyL3N0cm5kdXAtMS5jICAodGVzdCBmb3Igd2FybmluZ3MsIGxpbmUgMTEpDQpGQUlMOiBjLWMr
Ky1jb21tb24vY3BwL3ByMTA0MTQ3LmMgIC1XYysrLWNvbXBhdCAgZXhlY3V0aW9uIHRlc3QNCkZB
SUw6IGdjYy5kZy9wcjEwMjIyNC5jIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvcHIxMDI3
OTguYyBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3ByMTAzODYwLmMgZXhlY3V0aW9uIHRl
c3QNCkZBSUw6IGdjYy5kZy9zc28tMTYuYyBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL2lw
YS9wcjEwMzA4My0xLmMgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy9sdG8vcHIxMDE4Njgg
Y19sdG9fcHIxMDE4NjhfMC5vLWNfbHRvX3ByMTAxODY4XzMubyBleGVjdXRlIC1PMiAtZm5vLXN0
cmljdC1hbGlhc2luZyAtZmx0bw0KRkFJTDogZ2NjLmRnL2x0by9wcjEwMTk0OSBjX2x0b19wcjEw
MTk0OV8wLm8tY19sdG9fcHIxMDE5NDlfMS5vIGV4ZWN1dGUgLU8yIC1maXBhLXB0YSAtZmx0byAt
Zmx0by1wYXJ0aXRpb249MXRvMQ0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDIxMzkuYyAgIC1P
MCAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3ByMTAyMTM5LmMgICAtTzEg
IGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwMjEzOS5jICAgLU8yICBl
eGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDIxMzkuYyAgIC1PMyAtZyAg
ZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3ByMTAyMTM5LmMgICAtT3MgIGV4
ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwMjEzOS5jICAgLU8yIC1mbHRv
IC1mbm8tdXNlLWxpbmtlci1wbHVnaW4gLWZsdG8tcGFydGl0aW9uPW5vbmUgIGV4ZWN1dGlvbiB0
ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwMjEzOS5jICAgLU8yIC1mbHRvIC1mdXNlLWxp
bmtlci1wbHVnaW4gLWZuby1mYXQtbHRvLW9iamVjdHMgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBn
Y2MuZGcvdG9ydHVyZS9wcjEwMzE4MS5jICAgLU8wICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2Nj
LmRnL3RvcnR1cmUvcHIxMDMxODEuYyAgIC1PMSAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5k
Zy90b3J0dXJlL3ByMTAzMTgxLmMgICAtTzIgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcv
dG9ydHVyZS9wcjEwMzE4MS5jICAgLU8zIC1nICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRn
L3RvcnR1cmUvcHIxMDMxODEuYyAgIC1PcyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90
b3J0dXJlL3ByMTAzMTgxLmMgICAtTzIgLWZsdG8gLWZuby11c2UtbGlua2VyLXBsdWdpbiAtZmx0
by1wYXJ0aXRpb249bm9uZSAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3By
MTAzMTgxLmMgICAtTzIgLWZsdG8gLWZ1c2UtbGlua2VyLXBsdWdpbiAtZm5vLWZhdC1sdG8tb2Jq
ZWN0cyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3ByMTAzMjM3LmMgICAt
TzAgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwMzIzNy5jICAgLU8x
ICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDMyMzcuYyAgIC1PMiAg
ZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3ByMTAzMjM3LmMgICAtTzMgLWZv
bWl0LWZyYW1lLXBvaW50ZXIgLWZ1bnJvbGwtbG9vcHMgLWZwZWVsLWxvb3BzIC1mdHJhY2VyIC1m
aW5saW5lLWZ1bmN0aW9ucyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3By
MTAzMjM3LmMgICAtTzMgLWcgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9w
cjEwMzIzNy5jICAgLU9zICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIx
MDMyMzcuYyAgIC1PMiAtZmx0byAtZm5vLXVzZS1saW5rZXItcGx1Z2luIC1mbHRvLXBhcnRpdGlv
bj1ub25lICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDMyMzcuYyAg
IC1PMiAtZmx0byAtZnVzZS1saW5rZXItcGx1Z2luIC1mbm8tZmF0LWx0by1vYmplY3RzICBleGVj
dXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDUxOTguYyAgIC1PMCAgZXhlY3V0
aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3ByMTA1MTk4LmMgICAtTzEgIGV4ZWN1dGlv
biB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwNTE5OC5jICAgLU8yICBleGVjdXRpb24g
dGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDUxOTguYyAgIC1PMyAtZm9taXQtZnJhbWUt
cG9pbnRlciAtZnVucm9sbC1sb29wcyAtZnBlZWwtbG9vcHMgLWZ0cmFjZXIgLWZpbmxpbmUtZnVu
Y3Rpb25zICBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLmRnL3RvcnR1cmUvcHIxMDUxOTguYyAg
IC1PMyAtZyAgZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy5kZy90b3J0dXJlL3ByMTA1MTk4LmMg
ICAtT3MgIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwNTE5OC5jICAg
LU8yIC1mbHRvIC1mbm8tdXNlLWxpbmtlci1wbHVnaW4gLWZsdG8tcGFydGl0aW9uPW5vbmUgIGV4
ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MuZGcvdG9ydHVyZS9wcjEwNTE5OC5jICAgLU8yIC1mbHRv
IC1mdXNlLWxpbmtlci1wbHVnaW4gLWZuby1mYXQtbHRvLW9iamVjdHMgIGV4ZWN1dGlvbiB0ZXN0
DQpGQUlMOiBnY2MuZGcvdmVjdC9iYi1zbHAtcHIxMDE2MTUtMi5jIGV4ZWN1dGlvbiB0ZXN0DQpG
QUlMOiBnY2MuZGcvdmVjdC9iYi1zbHAtcHIxMDE2MTUtMi5jIC1mbHRvIC1mZmF0LWx0by1vYmpl
Y3RzIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MudGFyZ2V0L2kzODYvYXZ4LXByMTAyMjI0LmMg
ZXhlY3V0aW9uIHRlc3QNCkZBSUw6IGdjYy50YXJnZXQvaTM4Ni9hdng1MTJmLXByMTAxNDcxLmMg
KHRlc3QgZm9yIGV4Y2VzcyBlcnJvcnMpDQpGQUlMOiBnY2MudGFyZ2V0L2kzODYvYXZ4NTEyZi1w
cjEwMTQ3MS5jIGV4ZWN1dGlvbiB0ZXN0DQpGQUlMOiBnY2MudGFyZ2V0L2kzODYvcHIxMDI0OTgu
YyBleGVjdXRpb24gdGVzdA0KRkFJTDogZ2NjLnRhcmdldC9pMzg2L3ByMTAyNjI3LmMgZXhlY3V0
aW9uIHRlc3QNCkZBSUw6IGdjYy50YXJnZXQvaTM4Ni9wcjEwNDk3MS5jIGV4ZWN1dGlvbiB0ZXN0
DQpGQUlMOiBnY2MudGFyZ2V0L2kzODYvcHIxMDUwMDAtMS5jICh0ZXN0IGZvciBleGNlc3MgZXJy
b3JzKQ0KRkFJTDogZ2NjLnRhcmdldC9pMzg2L3ByMTA1MDAwLTIuYyAodGVzdCBmb3IgZXhjZXNz
IGVycm9ycykNCkZBSUw6IGdjYy50YXJnZXQvaTM4Ni9wcjEwNTAwMC0zLmMgKHRlc3QgZm9yIGV4
Y2VzcyBlcnJvcnMpDQpGQUlMOiBnY2MudGFyZ2V0L2kzODYvcHI5OTc1NC0xLmMgZXhlY3V0aW9u
IHRlc3QNCkZBSUw6IGdjYy50YXJnZXQvaTM4Ni9wcjk5NzU0LTIuYyBleGVjdXRpb24gdGVzdA==

--------------dQosiDXkoKRCtPQBLCUi0006--
